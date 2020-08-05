export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="/tmp/XDG_runtime_$(id -u)"
mkdir -p --mode=0700 ${XDG_RUNTIME_DIR}

source ${XDG_CONFIG_HOME}/shell/XDG_Base_Directory_fix.sh
source ${XDG_CONFIG_HOME}/shell/exports.sh

# autologin on tty1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
        exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
