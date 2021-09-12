if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

for s in "${HOME}"/.config/bashcomp.d/*.bash; do
    [ -r "${s}" ] && . "${s}"
done

source <(kitty + complete setup bash)
source <(kubectl completion bash)

__git_complete g git
__git_complete dots git
complete -F __start_kubectl k
complete -F _complete-go-dir cdgo
