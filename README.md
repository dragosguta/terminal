# Terminal config for ZSH
A minimal config for ZSH without relying on [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh). Less bloated, with important functionality perserved.

The goal is to maintain most of the functionality combined with an extremely fast start up time, since waiting for new shells to load while working is an annoying experience. 

## Better terminal commands
This config aliases some default commands to use specific options. It also alias a few of them to use new external versions. Read more below.

### External commands
Default commands replaced with new versions:

1. [exa](https://github.com/ogham/exa) - improved 'ls'
2. [bat](https://github.com/sharkdp/bat) - improved 'cat'
3. [zioxide](https://github.com/ajeetdsouza/zoxide) - improved 'cd'

### Potential future commands
Waiting to see if there is a need for these:

1. [zenith](https://github.com/bvaisvil/zenith) - improved 'htop' or similar
2. [tealdeer](https://github.com/dbrgn/tealdeer) - tldr for man pages

## Creating a plugins directory
This config expects the following directory `$HOME/.zsh_plugins` to exist and to contain the following plugins:

### Main plugins
1. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

Clone them in the `$HOME/.zsh_plugins` directory via git. Plugins are loaded last. 

### Potential future plugins
Waiting to see if there is a need for these:

1. [ripgrep](https://github.com/burntsushi/ripgrep) - search directories by pattern
2. [zinit](https://github.com/zdharma-continuum/zinit) -fast ZSH plugin manager
3. [batgrep](https://github.com/eth-p/bat-extras/blob/master/doc/batgrep.md) - add bat to ripgrep

### Deprecated plugins
I've used these before in the past but haven't really found them as useful. There might be better alternatives out there, and the latest `.zshrc` doesn't load them anymore.

1. [key-bindings](https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/key-bindings.zsh) - oh-my-zsh keybindings
2. [history](https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh) - oh-my-zsh history config
3. [completion](https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh) - oh-my-zsh tab completion

Install these with something like `wget` in the same `$HOME/.zsh_plugins` directory.

Additional plugins can be found in the [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) repo.

### Managing node
This shell config relies on [fnm](https://github.com/Schniz/fnm) to manage node, install via `brew install fnm`. I've found `fnm` to be _significantly_ faster and more performant than older equivalents like `nvm`.

## Theming

### Spaceship vs. Starship
I've experimented with both. Starship is _significantly_ faster. The prompt is essentially lag free, whereas Spaceship had slight, but noticeable, lag on my machine.

This config relies on the [starship](https://starship.rs/) theme. Install it via brew by running `brew install starship`. For other installation methods, consult the starship repo.

### Starship config
Create a file in `$HOME/.starship/config.toml` for the config file, or set the location on line 156 in this `.zshrc` file.

## Other dependencies
The `di` docker command relies on [jq](https://stedolan.github.io/jq/download/).

## Sources
A lot of the configuration was drawn from two major sources:
1. https://sourabhbajaj.com/mac-setup/iTerm/zsh.html
2. https://tjay.dev/howto-my-terminal-shell-setup-hyper-js-zsh-starship/


