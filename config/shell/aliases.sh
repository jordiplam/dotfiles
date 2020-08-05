# XBPS aliases
alias xup="doas xbps-install -Su"
alias xqry="doas xbps-query -Rs"
alias xrm="doas xbps-remove -R"
alias xrmc="doas xbps-remove -Oo"

# Useful aliases.
alias sudo='doas'
alias ls='ls --color=auto'
alias halt='doas halt'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias rmr='rm -rI'

# Use the masterpdf editor version with unlocked options for free.
alias masterpdfeditor='/opt/master-pdf-editor-4/masterpdfeditor4'
# Use mpv with a youtube playlist.
alias mpvlist='mpv --ytdl-raw-options="yes-playlist="'
# Use XDG directories in nvidia-settings.
alias nvidia-settings="nvidia-settings --config=${XDG_CONFIG_HOME}/nvidia/settings"

