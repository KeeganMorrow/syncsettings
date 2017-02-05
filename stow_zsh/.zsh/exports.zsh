export EDITOR=vim
export PATH="$PATH:${HOME}/bin/bin:${HOME}/syncsettings/bin"

# Socket to use for communicating with bspwm, also in config/bspwm/bspwm_wrapper.sh
export BSPWM_SOCKET="/tmp/bspwm-socket.${USER}"

# Use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
