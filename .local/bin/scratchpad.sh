#! /bin/zsh
alacritty -t scratchpad --class scratchpad --config-file =(sed 's/background_opacity.*/background_opacity: 1.0/' /home/david/.config/alacritty/alacritty.yml)

