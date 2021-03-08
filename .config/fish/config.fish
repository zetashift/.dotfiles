
#Remove the prompt
set -g fish_greeting
fish_add_path ~/.emacs.d/bin
fish_add_path ~/.nimble/bin
fish_add_path ~/spicetify-cli/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
set SPICETIFY_INSTALL ~/spicetify-cli/
alias em="emacsclient -c --alternate-editor="""
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/rishi/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

