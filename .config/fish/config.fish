#Remove the prompt
set -g fish_greeting

fish_add_path ~/.nimble/bin
fish_add_path ~/Applications/
fish_add_path ~/spicetify-cli/
fish_add_path ~/.local/share/coursier/bin
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias oni="Onivim2-x86_64-master_88c241e1c3010ab0146b7b68d7760742.AppImage"
alias v="nvim"
set SPICETIFY_INSTALL ~/spicetify-cli/

starship init fish | source
any-nix-shell fish --info-right | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/rishi/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

direnv hook fish | source
