#!/bin/zsh
if [[ -f /etc/*-release ]]; then
  _distro=$(awk -F= '/^ID=/{print tolower($2)}' /etc/*-release)
elif [[ -f /System/Library/CoreServices/SystemVersion.plist ]]; then
  _distro="macos"
fi
case $_distro in
  *macos*) ICON="";;
  *ubuntu*) ICON="";;
  *arch*) ICON="";;
  *) ICON="";;
esac
export STARSHIP_DISTRO="$ICON"
