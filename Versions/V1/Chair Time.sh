#!/bin/sh
printf '\033c\033]0;%s\a' Chair Time
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Chair Time.x86_64" "$@"
