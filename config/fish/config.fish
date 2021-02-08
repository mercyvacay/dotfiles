# Remove greeting message
set -g -x fish_greeting ''

# Colors for ls in Mac OS (maybe not needed?)
set -x CLICOLOR true

# Fix for Vim YCM w/ peekaboo freeking out
# set -x LC_CTYPE "en_US.UTF-8"

set -x PATH $HOME/.local/bin $PATH

# Set Vim as the default editor.
set -x EDITOR /usr/bin/vim

. ~/.bash_aliases
if test -f ~/.bash_aliases.after
    . ~/.bash_aliases.after
end

if test -f ~/.config/fish/config-after.fish
    . ~/.config/fish/config-after.fish
end
