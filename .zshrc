# Download Znap, if it's not there yet.
[[ -f ~/znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/znap/zsh-snap

source ~/znap/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

# source $ZSH/oh-my-zsh.sh
source $HOME/.profile

# Corretto JDK env vars
export JDK21=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
export JDK17=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
export JDK11=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

# Cargo
. "$HOME/.cargo/env"

# Go bin
export PATH=$PATH:$HOME/go/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias
alias lg=lazygit
alias ls=exa
alias v=nvim
alias vc="nvim ."

