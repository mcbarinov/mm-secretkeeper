# mm-secretkeeper

It's a CLI tool to store and retrieve secrets on a local machine. 

- It uses sqlcipher3 to store secrets in an encrypted SQLite database. 
- It uses pyperclip to copy secrets to the clipboard. 
- It uses python-daemon to run as a daemon. 
- It uses typer to create the CLI interface. 
- It uses fastapi to create a web interface.

## How to install on macOS

```sh
brew install sqlcipher
export LDFLAGS="-L$(brew --prefix sqlcipher)/lib"
export CPPFLAGS="-I$(brew --prefix sqlcipher)/include"
uv add sqlcipher3==0.5.4
```
