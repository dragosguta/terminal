# Terminal config for ZSH
A minimal config for ZSH without relying on [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh). Less bloated, with near 90% of the functionality :)

## Creating a plugins directory
This config expects the following directory `$HOME/.zsh_plugins` to exist and to contain the following plugins:

1. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
3. [key-bindings](https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/key-bindings.zsh)
4. [history](https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh)
5. [completion](https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh)

Clone the first two in the plugins directory, and use something like `wget` on the next three.

For more fun plugins, consult the [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) repo.

### Managing node
This shell config relies on [fnm](https://github.com/Schniz/fnm) to manage node, install via `brew install Schniz/tap/fnm`. I've found `fnm` to be _significantly_ faster and more performant than older equivalents like `nvm`.

## Theming

### Spaceship vs. Starship
I've experimented with both. Starship is _significantly_ faster since it's built with rust. The prompt is essentially lag free, whereas Spaceship had slight, but noticeable, lag on my machine.

This config relies on the [starship](https://starship.rs/) theme. Install it via brew by running `brew install starship`. For other installation methods, consult the starship repo.

### Starship config
Create a file in `$HOME/.starship/config.toml` for the config file, or set the location on line 26 in this `.zshrc` file. The `config.toml` file is barebones, so consult the starship site for more options.

## Other dependencies
The `di` docker command relies on [jq](https://stedolan.github.io/jq/download/).

## Sources
A lot of the configuration was drawn from two major sources:
1. https://sourabhbajaj.com/mac-setup/iTerm/zsh.html
2. https://tjay.dev/howto-my-terminal-shell-setup-hyper-js-zsh-starship/


