import fnmatch
import glob
import json
import os
import pwd
import sys

from invoke import Collection
from invoke import run
from invoke import task


CONFIG = {}
DOTDIR = "~/.dots/"


@task
def read_config(ctx):
    global CONFIG
    with open("./config.json") as fp:
        CONFIG = json.load(fp)


@task
def init_submodules(ctx):
    description("Update submodules")
    ctx.run("git submodule update --init --recursive")


@task(read_config)
def link(ctx):
    description("Creating symlinks...")
    apply("symlinks", symlink_op)
    end()


@task(read_config)
def unlink(ctx):
    description("Removing symlinks...")
    apply("symlinks", remove_op)
    end()


@task(read_config)
def copy(ctx):
    description("Copying files...")
    apply("copy", copy_op)
    end()


@task
def update_brews(ctx):
    description("Instaling/updating homebrew packages")
    ctx.run("brew update", warn=True)
    ctx.run("brew upgrade", warn=True)


@task(read_config)
def install_brews(ctx):
    info("Tapping...")
    for tap in CONFIG.get("taps", []):
        op(f"Tap {tap}")
        ctx.run(f"brew tap {tap}", hide="both")

    info("Installings brews...")
    for brew in CONFIG.get("formulas", []):
        op(f"Install {brew}")
        ctx.run(f"brew install {brew}", hide="both", warn=True)
    end()


@task(post=[update_brews, install_brews])
def install_homebrew(ctx):
    if ctx.run("which brew", warn=True, hide=True).failed:
        description("Installing homebrew")
        url = "https://raw.githubusercontent.com/Homebrew/install/master/install"
        ctx.run(f'ruby -e "$(curl -fsSL {url})"')


@task
def setup_vim(ctx):
    description("Setting up vim")
    info("Installing vim plugins")
    ctx.run("nvim --noplugin -u ~/.config/nvim/plugins.vim -N +PlugInstall +qa", pty=True)
    end()


@task
def update_vim(ctx):
    info("Updating vim plugins")
    ctx.run(
        "nvim --noplugin -u ~/.config/nvim/plugins.vim -N +PlugUpdate +PlugUpgrade +qa", pty=True
    )
    end()


@task
def enable_zsh(ctx):
    description("Setup zsh")
    if "zsh" in os.environ["SHELL"]:
        info("zsh is already configured as default shell")
        end()
        return

    info("configure zsh as default shell")
    if os.path.exists("/usr/local/bin/zsh"):
        with open("/private/etc/shells") as fp:
            if "/usr/local/bin/zsh" not in fp.readlines():
                ctx.run('echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells')

        ctx.run("chsh -s /usr/local/bin/zsh")
    else:
        ctx.run("chsh -s /bin/zsh")
    end()


@task
def install_iterm_themes(ctx):
    description("Installing iterm themes")

    tool = "/usr/libexec/PlistBuddy -c"
    plist = "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
    for theme_file in fnmatch.filter(os.listdir("iterm"), "*.itermcolors"):
        theme_name = os.path.splitext(theme_file)[0]
        file_path = os.path.join("iterm", theme_file)
        entry = f":'Custom Color Presets':'{theme_name}'"

        info(f"Adding {theme_name}")
        if ctx.run(f'{tool} "Add {entry} dict" "{plist}"', warn=True).ok:
            ctx.run(f'{tool} "Merge \'{file_path}\' {entry}" "{plist}"')
    end()


@task(pre=[read_config, init_submodules, link], post=[enable_zsh, setup_vim, install_iterm_themes])
def install(ctx):
    if sys.platform == "darwin":
        install_homebrew(ctx)


@task(read_config, unlink)
def uninstall(ctx):
    pass


@task(post=[update_brews, update_vim])
def update(ctx):
    description("Updating")


def isdirname(path):
    return path.endswith(os.path.sep) or path == "~"


def normalize(path):
    return os.path.expanduser(os.path.expandvars(path))


def commonpath(paths):
    paths = (os.path.dirname(p) if not os.path.isdir(p) else p for p in paths)
    norm_paths = [os.path.abspath(p) + os.path.sep for p in paths]
    return os.path.dirname(os.path.commonprefix(norm_paths))


def collapseuser(path):
    home_dir = os.environ.get("HOME", pwd.getpwuid(os.getuid()).pw_dir)
    if os.path.samefile(home_dir, commonpath([path, home_dir])):
        relpath = os.path.relpath(path, home_dir)
        return os.path.join("~", relpath) if relpath != "." else "~"
    return path


def expand_target(target, source):
    normalized = normalize(target)
    if isdirname(target):
        normalized = os.path.join(normalized, os.path.basename(source))
    return normalized.rstrip("/")


def expand_targets(target, source_glob):
    if not isdirname(target) and "*" in source_glob or "?" in source_glob:
        error("Invalid link target. Maybe you forgot the trailing /")
        return []
    target_dir = os.path.dirname(normalize(target))
    if isdirname(source_glob):
        target_dir = os.path.dirname(target_dir)
    if not os.path.exists(target_dir):
        op(f"Creating dir for link targets {collapseuser(target_dir)}")
        run('mkdir -p "{}"'.format(target_dir))

    expanded = []
    for source in glob.iglob(os.path.join("symlinks", source_glob)):
        source = normalize(os.path.join(DOTDIR, source))
        expanded_target = expand_target(target, source)
        expanded.append((source, expanded_target))
    return expanded


def symlink_op(src, dst):
    op(f"Symlink {collapseuser(src)} ==> {collapseuser(dst)}")
    run(f'ln -snf "{src}" "{dst}"')


def remove_op(src, dst):
    op(f"Remove {collapseuser(dst)}")
    run(f'rm -f "{dst}"'.format(dst))


def copy_op(src, dst):
    op(f"Copy {collapseuser(src)} ==> {collapseuser(dst)}")
    run(f'cp -f "{src}" "{dst}"')


def apply(section, cmd):
    mapping = CONFIG.get(section, {})
    for source_glob, target in mapping.items():
        for src, dst in expand_targets(target, source_glob):
            cmd(src, dst)


def description(message):
    print(f" ==> {message}")


def info(message):
    print(f" --> {message}")


def error(message):
    print(f" ### {message}")


def op(message):
    print(f"  -> {message}")


end = print

ns = Collection()
ns.add_task(install)
ns.add_task(install_homebrew)
ns.add_task(install_brews)
ns.add_task(update)
ns.add_task(update_vim)
ns.add_task(update_brews)
ns.add_task(setup_vim)
ns.add_task(link)
ns.add_task(unlink)
ns.add_task(copy)
