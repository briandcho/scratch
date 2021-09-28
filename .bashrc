#!/bin/bash

is_in() { local arg e=$1;shift;for arg; do if [[ $e == "$arg" ]]; then return 0; fi; done; return 1; }
rm() { [[ -d "$HOME"/.Trash ]] || mkdir "$HOME"/.Trash; mv "$@" "$HOME"/.Trash; }
expunge() { find "$HOME"/.Trash | tail -n+2 | xargs /bin/rm --; }
