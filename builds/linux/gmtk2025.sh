#!/bin/sh
echo -ne '\033c\033]0;GMTK2025\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/gmtk2025.x86_64" "$@"
