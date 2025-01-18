secret-keeper

--> How install on macOS
brew install sqlcipher
export LDFLAGS="-L$(brew --prefix sqlcipher)/lib"
export CPPFLAGS="-I$(brew --prefix sqlcipher)/include"
uv add sqlcipher3==0.5.4
