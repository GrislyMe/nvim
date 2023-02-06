#!/bin/sh
mkdir -p ~/.config/nvim/lua
ln -srf ./*.lua ~/.config/nvim/lua
ln -srf ./init.lua ~/.config/nvim
rm ~/.config/nvim/lua/init.lua
