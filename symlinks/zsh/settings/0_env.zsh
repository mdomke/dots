export LC_CTYPE="en_US.UTF-8"

export EDITOR="nvim"
export VISUAL="nvim"

export ASDF_DIR="${HOME}/.asdf"
export GOPATH="${HOME}/.gopath"
export GOBIN="${GOPATH}/bin"
export HSPATH="${HOME}/.cabal/bin"
export RSPATH="${HOME}/.cargo/bin"
export TEXBINDIR="/Library/TeX/texbin"
export GNUBIN="/usr/local/opt/gnu-getopt/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin"
export SQLITEBIN="/usr/local/opt/sqlite/bin"

export PATH="${GNUBIN}:${HOME}/.bin:${HOME}/.local/bin:${SQLITEBIN}:${PATH}:${HSPATH}:${RSPATH}:${GOBIN}:${TEXBINDIR}:/usr/local/opt/avr-gcc@8/bin"

export UMBRELLA_CHART_REPO="$HOME/Source/figo/deployment/finx-chart"
export PARTNER_CONFIG_REPO="$HOME/Source/figo/platform/partner-configurations"
