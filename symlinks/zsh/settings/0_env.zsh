export LC_CTYPE="en_US.UTF-8"

export EDITOR="hx"
export VISUAL="hx"

export ASDF_DIR="${HOME}/.asdf"
export GOPATH="${HOME}/.gopath"
export GOBIN="${GOPATH}/bin"
export HSPATH="${HOME}/.cabal/bin"
export RSPATH="${HOME}/.cargo/bin"
export TEXBINDIR="/Library/TeX/texbin"
export HOMEBREW_PREFIX="/opt/homebrew"
export GNUBIN="${HOMEBREW_PREFIX}/opt/gnu-getopt/bin:${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin"
export SQLITEBIN="/usr/local/opt/sqlite/bin"

export PATH="${GNUBIN}:${HOME}/.bin:${HOME}/.local/bin:${HOMEBREW_PREFIX}/bin:${SQLITEBIN}:${PATH}:${HSPATH}:${RSPATH}:${GOBIN}:${TEXBINDIR}:/opt/homebrew/opt/avr-gcc@8/bin"

export UMBRELLA_CHART_REPO="$HOME/Source/figo/deployment/finx-chart"
export PARTNER_CONFIG_REPO="$HOME/Source/figo/platform/partner-configurations"
