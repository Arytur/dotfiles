source "$XDG_CONFIG_HOME/zsh/aliases"

# vi mode
bindkey -v
export KEYTIMEOUT=1
source "$DOTFILES/zsh/external/cursor_mode"
autoload -Uz cursor_mode && cursor_mode
# vi keys for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# edit command in nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# remap clear terminal screen
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# Autocompletion
autoload -Uz compinit; compinit
# Autocomplete hidden files
_comp_options+=(globdots)
source "$DOTFILES/zsh/external/completion.zsh"

# autoload everything in "external" directory
fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the directory visited on the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# syntax hightlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# jump to parent directory
source "$DOTFILES/zsh/external/bd.zsh"

# fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# run i3 at startup
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
