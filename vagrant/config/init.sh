#! /bin/bash

source ~/.Envfile
export PATH=~/node_modules/.bin/:~/.local/bin/:$PATH

cat > ~/.bash_profile <<EOL
source ~/.bashrc
source ~/.Envfile
export PATH=~/node_modules/.bin/:~/.local/bin/:$PATH
EOL
