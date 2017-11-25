git clone https://github.com/syndbg/goenv.git ~/.goenv

echo '
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"'>> ~/.zshrc_person
