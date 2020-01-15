#!/bin/sh

# Infer Training
# Get the audit targets and do some fixups

# Get skynet
git clone https://github.com/cloudwu/skynet skynet 
cd skynet 
git checkout a6293f27cd08cbe33b5dc99b561e54659d544d54
cd ..

# Get bsdgames
git clone https://github.com/vattam/BSDGames bsdgames 
cd bsdgames 
git checkout 56b8944332186891cd5c0094bd3991e3c5f5a799

mkdir -p ./temp-dictionary && touch ./temp-dictionary/words
grep -rl getline . | xargs sed -i 's/getline/bog_getline/g'
cd ..

# Get angbnd
curl -o angband.tar.gz http://rephial.org/downloads/4.2/angband-4.2.0.tar.gz
tar xf angband.tar.gz
rm angband.tar.gz
cd angband-4.2.0 && ./autogen.sh
cd ..

