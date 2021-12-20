# ZSH Environment related settings

export PATH="$PATH:\ 
  $HOME/bin:\ 
  $HOME/go/bin:\ 
  $HOME/.node_modules/bin:\ 
  $HOME/.gem/ruby/2.6.0/bin:\ 
  $HOME/.local/bin:\ 
  $HOME/.composer/vendor/bin:\ 
  $HOME/.config/yarn/global"
export SUDO_EDIT="/usr/bin/nvim"
export $(dbus-launch)

export npm_config_prefix=~/.node_modules
export ZSH_TMUX_AUTOSTART=true
source "$HOME/.cargo/env"
