Bootstraping
============

This repo contains everything to bootsrap a new machine from scratch and to setup
all applications and services I commonly use. This includes especially the ZSH shell
and the VIM text editor.

As prerequisites you need to have Python 3 installed.

```bash
$ python3 -m pip install --user pipx
$ python3 -m pipx ensurepath
$ pipx invoke
```
Afterwards it's basically

```bash
$ git clone git@github.com:mdomke/dots.git .dots
$ cd .dots
$ inv install
```

and you're done.
