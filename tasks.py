from __future__ import print_function

import fnmatch
import glob
import json
import os
import pwd
import sys

from invoke import task, run


CONFIG = {}
DOTDIR = '~/.dots/'
SYMLINKDIR = 'symlinks'


@task
def read_config():
    global CONFIG
    with open('./config.json') as fp:
        CONFIG = json.load(fp)


@task
def init_submodules():
    description('Update submodules')
    run('git submodule update --init --recursive')


@task(read_config, init_submodules)
def install():
    link()

    if sys.platform == 'darwin':
        install_homebrew()

    enable_zsh()
    setup_vim()
    install_iterm_themes()
    install_python_essentials()


@task(read_config)
def uninstall():
    unlink()


@task
def update():
    description('Updating')
    update_homebrew()
    update_vim_plugins()


@task
def install_homebrew():
    if run('which brew', warn=True, hide=True).failed:
        description('Installing homebrew')
        url = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
        run('ruby -e "$(curl -fsSL %s)"' % url)

    update_homebrew()
    install_brews()


@task
def update_homebrew():
    description('Instaling/updating homebrew packages')
    run('brew update', warn=True)
    run('brew upgrade', warn=True)


@task(read_config)
def install_brews():
    info('Tapping...')
    for tap in CONFIG.get('taps', []):
        op('Tap %s' % tap)
        run('brew tap %s' % tap, hide='both')

    info('Installings brews...')
    for brew in CONFIG.get('formulas', []):
        op('Install %s' % brew)
        run('brew install %s' % brew, hide='both', warn=True)

    info('Installings casks...')
    for cask in CONFIG.get('casks', []):
        op('Install %s' % cask)
        run('brew cask install %s' % cask, hide='both')
    end()


@task
def setup_vim():
    description('Setting up vim')
    install_vimplug()
    install_vim_plugins()
    end()


def install_vimplug():
    info('Installing vim plugin manager')
    run('curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs '
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')


def install_vim_plugins():
    info('Installing vim plugins')
    run('nvim --noplugin -u ~/.config/nvim/plugins.vim -N +PlugInstall +qa', pty=True)


@task
def update_vim_plugins():
    info('Updating vim plugins')
    run('nvim --noplugin -u ~/.config/nvim/plugins.vim -N +PlugUpdate +PlugUpgrade +qa', pty=True)
    end()


@task
def enable_zsh():
    description('Setup zsh')
    if 'zsh' in os.environ['SHELL']:
        info('zsh is already configured as default shell')
        end()
        return

    info('configure zsh as default shell')
    if os.path.exists('/usr/local/bin/zsh'):
        with open('/private/etc/shells') as fp:
            if '/usr/local/bin/zsh' not in fp.readlines():
                run('echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells')

        run('chsh -s /usr/local/bin/zsh')
    else:
        run('chsh -s /bin/zsh')
    end()


@task
def install_iterm_themes():
    description('Installing iterm themes')

    tool = '/usr/libexec/PlistBuddy -c'
    plist = '$HOME/Library/Preferences/com.googlecode.iterm2.plist'
    for theme_file in fnmatch.filter(os.listdir('iterm'), '*.itermcolors'):
        theme_name = os.path.splitext(theme_file)[0]
        file_path = os.path.join('iterm', theme_file)
        entry = ":'Custom Color Presets':'{}'".format(theme_name)

        info('Adding %s' % theme_name)
        if run('{} "Add {} dict" "{}"'.format(tool, entry, plist), warn=True).ok:
            run('{} "Merge \'{}\' {}" "{}"'.format(tool, file_path, entry, plist))
    end()


@task
def install_python_essentials():
    description('Install essential python tools')
    packages = ['neovim', 'pygments']
    for package in packages:
        run('pip install %s' % package)


def isdirname(path):
    return path.endswith(os.path.sep) or path == '~'


def normalize(path):
    return os.path.expanduser(os.path.expandvars(path))


def commonpath(paths):
    paths = (os.path.dirname(p) if not os.path.isdir(p) else p for p in paths)
    norm_paths = [os.path.abspath(p) + os.path.sep for p in paths]
    return os.path.dirname(os.path.commonprefix(norm_paths))


def collapseuser(path):
    home_dir = os.environ.get('HOME', pwd.getpwuid(os.getuid()).pw_dir)
    if os.path.samefile(home_dir, commonpath([path, home_dir])):
        relpath = os.path.relpath(path, home_dir)
        return os.path.join('~', relpath) if relpath != '.' else '~'
    return path


def expand_target(target, source):
    normalized = normalize(target)
    if isdirname(target):
        normalized = os.path.join(normalized, os.path.basename(source))
    return normalized.rstrip('/')


def expand_targets(target, source_glob):
    if not isdirname(target) and '*' in source_glob or '?' in source_glob:
        error('Invalid link target. Maybe you forgot the trailing /')
        return []
    target_dir = os.path.dirname(normalize(target))
    if isdirname(source_glob):
        target_dir = os.path.dirname(target_dir)
    if not os.path.exists(target_dir):
        op('Creating dir for link targets (%s)' % collapseuser(target_dir))
        run('mkdir -p "{}"'.format(target_dir))

    expanded = []
    for source in glob.iglob(os.path.join(SYMLINKDIR, source_glob)):
        source = normalize(os.path.join(DOTDIR, source))
        expanded_target = expand_target(target, source)
        expanded.append((source, expanded_target))
    return expanded


@task(read_config)
def link():
    description('Creating symlinks...')
    link_op()
    end()


@task(read_config)
def unlink():
    description('Removing symlinks...')
    link_op(create=False)
    end()


def link_op(create=True):
    symlinks = CONFIG.get('symlinks', {})
    for source_glob, target in symlinks.items():
        for source, expanded_target in expand_targets(target, source_glob):
            src = collapseuser(source)
            dst = collapseuser(expanded_target)
            if create:
                op('Symlink {} ==> {}'.format(src, dst))
                run('ln -snf "%s" "%s"' % (source, expanded_target))
            else:
                op('Remove {}'.format(dst))
                run('rm -f "%s"' % expanded_target)


def description(message):
    print(" ===> %s" % message)


def info(message):
    print(" ---> %s" % message)


def error(message):
    print(" #### %s" % message)


def op(message):
    print("   -> %s" % message)


def end():
    print()
