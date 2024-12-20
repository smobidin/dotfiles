autoload -Uz up-line-or-beginning-search down-line-or-beginning-search edit-command-line

exit_zsh() { exit; }

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line
zle -N exit_zsh

#key[Control_Left]="${terminfo[kLFT5]}"
#key[Control_Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control_Left]}" ]] && bindkey -- "${key[Control_Left]}" backward-word
[[ -n "${key[Control_Right]}" ]] && bindkey -- "${key[Control_Right]}" forward-word
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[Home]}" ]] && bindkey -- "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey -- "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey -- "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
[[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
[[ -n "${key[PageUp]}" ]] && bindkey -- "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]] && bindkey -- "${key[PageDown]}" end-of-buffer-or-history

bindkey '^C' send-break
bindkey "^K" kill-whole-line
bindkey '^D' exit_zsh
bindkey '^Z' undo
bindkey '^x^e' edit-command-line

bindkey '^q' push-line-or-edit  # push command, use ctrl-y to yank it back
bindkey '^[q' push-line-or-edit # use ^[q to push single line while at PS2
