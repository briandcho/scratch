#!/bin/bash

confirm() { local y; read -rp "$*? " y; [[ $y =~ ^[Yy] ]]; }
expunge() {
  local n s=""
  n=$(ltrash | wc -l | tr -d \ )
  [[ $n -gt 0 ]] || return 0
  [[ $n -eq 1 ]] || s="s"
  confirm "Purge $n item$s" || return 0
  find "$HOME"/.Trash -depth 1 -print0 | xargs -0 /bin/rm
}
ltrash() { ls -1AF "$HOME/.Trash"; }
rm() { [[ -d "$HOME"/.Trash ]] || mkdir "$HOME"/.Trash; mv "$@" "$HOME"/.Trash; }
