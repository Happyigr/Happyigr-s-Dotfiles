#!/bin/bash

xdg-settings set default-web-browser firefox.desktop

# add this in .bashrc
# alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# firefox chrome css setup??
# user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true)
# user_pref("svg.context-properties.content.enabled", true)
# user_pref("WaveFox.Linux.Transparency.Enabled", false);
# user_pref("WaveFox.OneLine", 1);
# user_pref("WaveFox.Tabs.Shape", 4);
# user_pref("WaveFox.WebPage.Floating.Enabled", false);

# right prompt on starship and better bash
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source -- ~/.local/share/blesh/ble.sh' >> ~/.bashrc

# install miniconda in ~/.miniconda3 for voice recognition
# pip install pynput sounddevice soundfile

# whisper.cli cpp
# git clone https://github.com/ggml-org/whisper.cpp.git
# cd whisper.cpp
# sh ./models/download-ggml-model.sh base.en
# make -j medium
# cmake -B build -DGGML_CUDA=1
# cmake --build build -j --config Release
