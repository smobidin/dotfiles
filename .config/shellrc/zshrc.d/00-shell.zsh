setopt NO_FLOW_CONTROL

setopt CLOBBER
setopt HASH_LIST_ALL
setopt SHARE_HISTORY
setopt NO_MAIL_WARNING
setopt AUTO_PARAM_SLASH
setopt TRANSIENT_RPROMPT
setopt HIST_REDUCE_BLANKS
setopt COMPLETE_IN_WORD ALWAYS_TO_END
setopt APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS

typeset -U path cdpath fpath manpath

zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select=2
zstyle ':completion:*' keep-prefix true
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zcompcache
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:complete:*:options' sort false

## ignores filenames already in the line
# zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

zstyle ':completion:*:*:make:*' tag-order 'targets'

cd_aliases+=(
    [cdp]="${HOME}/projects"
    [cdc]="${XDG_CONFIG_HOME}"
)

for src in "${HOME}"/.config/shellrc/*.sh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

source "${XDG_CACHE_HOME}"/zcolors

declare -aU IGNORE_CMD=(
    "?" "??" "[bf]g" "sh-*"                     # one / two-letters commands and tools
    "fc *" "dots-*" "dots *" "hs-*# *"          # dotfiles and history management
    "rm *" "kill *" "killall *"                 # one-shot commands, literally
    "ps *" "pstree" "[h]top" "gotop"            # process / system info
    "man *" "* --help" "* --version"            # info and manuals
    "obey" "si" "sudo *" "*KEY*" "*TOKEN*"      # secutity
    "l[ls]#( *)" "up# *" "cd# *" "bak *" "md *" # all others
    "omc" "top-*" "uuid" "nscan-*" "t *" "wttr"
    "ex *" "clear" "reset" "exit" "cd[cpls]# *"
    "get *" "heads *" "yt[dav] *" "dps" "gcd"
    "pwd" "cal" "env" "si" "z8[dj]" "lst# *"
)

joined=""

for i in "${IGNORE_CMD[@]}"; do
    if [ -n "${joined}" ]; then
        joined="${joined}|${i}"
    else
        joined="${i}"
    fi
done

export HISTORY_IGNORE="(${joined})"
unset joined

alias sh-plugs-up='antibody bundle < "${SHELLRC_HOME}"/zsh_plugins.txt > "${SHELLRC_HOME}"/plugins.zsh'
