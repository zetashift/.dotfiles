
#Remove the prompt
set -g fish_greeting

fish_add_path ~/.nimble/bin
fish_add_path ~/Applications/
fish_add_path ~/spicetify-cli/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias oni="Onivim2-x86_64-master_effbd0e6f5f1b780fb7a6f3483131487.AppImage"
set SPICETIFY_INSTALL ~/spicetify-cli/

starship init fish | source
any-nix-shell fish --info-right | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/rishi/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

direnv hook fish | source