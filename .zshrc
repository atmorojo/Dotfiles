#
# Atmorojo's .zshrc
#


source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

autoload -Uz promptinit; promptinit; prompt pure
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#PYWAL
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Custom aliases
source ~/.dotfiles/aliases

. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# pnpm
#export PNPM_HOME="/home/atmorojo/.local/share/pnpm"
#export PATH="$PNPM_HOME:$PATH"
# pnpm end
