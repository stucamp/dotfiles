#!/bin/sh

BEGINNING="gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['$KEY_PATH/custom0/']"

# Take a screenshot of the entire display
$BEGINNING/custom0/ name "Terminal"
$BEGINNING/custom0/ command "/bin/tilix -s ~/.config/tilix/triple.json"
$BEGINNING/custom0/ binding "<super>Return"
