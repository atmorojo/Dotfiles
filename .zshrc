source ~/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle archlinux
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme garyblessington

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TMUX
ZSH_TMUX_AUTOSTART=true
