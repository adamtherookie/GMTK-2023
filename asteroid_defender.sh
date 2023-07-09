#!/bin/sh
echo -ne '\033c\033]0;GMTK 2023\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/asteroid_defender.x86_64" "$@"
