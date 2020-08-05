#!/bin/sh

export NO_AT_BRIDGE=1

export EDITOR='vis'
export GOPATH="${HOME}/go"
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/scripts:${GOPATH}/bin"

export DMENU_OPTIONS='-c -i -bw 3 -l 10 -fn "monospace:pixelsize=18"'
export DWM_BAR_PIPE="${XDG_RUNTIME_DIR}/dwm_bar_pipe"
