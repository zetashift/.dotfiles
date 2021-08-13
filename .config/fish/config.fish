#Remove the prompt
set -g fish_greeting

fish_add_path ~/.local/share/coursier/bin
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias v="nvim"

any-nix-shell fish --info-right | source



