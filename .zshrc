# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# auto-completion

fpath+=("${HOME}/.config/shellrc/zsh-completions")

export ZSH_COMPDUMP=${HOME}/.cache/zcompdump

autoload -Uz compinit

_setup_compdump() {
    compinit -i -d "${ZSH_COMPDUMP}"
    local zwc
    zwc="${ZSH_COMPDUMP}".zwc
    if [[ (! -f "${zwc}" || "${ZSH_COMPDUMP}" -nt "${zwc}") ]]; then
        zcompile -M "${ZSH_COMPDUMP}"
    fi
}

if [ ! -f "${ZSH_COMPDUMP}" ]; then
    _setup_compdump
else
    setopt EXTENDEDGLOB
    for _ in "${ZSH_COMPDUMP}"(#qN.mh+8); do
        _setup_compdump
    done
    setopt NO_EXTENDEDGLOB
fi

compinit -C -d "${ZSH_COMPDUMP}"

# plugins

source "${HOME}/.local/antidote/antidote.zsh"
export ZDOTDIR="${HOME}/.config/shellrc"

export FORGIT_NO_ALIASES="1"

antidote load

# other goodies

typeset -A cd_aliases

for src in "${HOME}"/.config/shellrc/zshrc.d/*.zsh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

# history setup

export SAVEHIST=1000
export HISTSIZE=1000
export HISTFILE="${XDG_CACHE_HOME}/zsh_history"

# create 'magic' aliases for contents of cd_aliases array

for kk in "${(@kk)cd_aliases}"; do
    function $kk() {
        local r="${cd_aliases[$0]}"
        if [ ! $# -eq 1 ]; then
            cd "$r" || return
        else
            cd "$r/${1}" || return
        fi
    }

    function _$kk() {
        ((CURRENT == 2)) && _files -/ -W $cd_aliases[${0:1}]
    }

    compdef _$kk $kk
done
unset kk
