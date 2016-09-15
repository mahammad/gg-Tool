#!/usr/bin/env bash
cd ~
wget https://raw.githubusercontent.com/mahammad/gg/master/gg.sh

sudo cp gg.sh /usr/local/bin/gg
sudo chmod +x /usr/local/bin/gg
sudo chown -R root:$USER /usr/local/bin/gg
