
Remove the promp
set -g fish_greeting

fish_add_path ~/.emacs.d/bin
fish_add_path ~/.nimble/bin
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/rishi/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

