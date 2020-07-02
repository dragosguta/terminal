# Terminal config for ZSH
A minimal config for ZSH without relying on [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh). Less bloated, with near 90% of the functionality :)

This config borrows several plugins from `oh-my-zsh`, namely:
```
1. history
2. completion
3. key-bindings
```

# Creating a plugins directory
This config expects the following directory `$HOME/.zsh_plugins` to exist and to contain the following plugins:

1. [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
3. [zsh-nvm](https://github.com/lukechilds/zsh-nvm)

For more fun plugins, consult the [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) repo.

# Theming
This config relies on the [starship](https://github.com/denysdovhan/spaceship-prompt) theme. Install it via brew by running `brew install starship`. For other installation methods, consult the starship repo.

# Other dependencies
The `di` docker command relies on [jq](https://stedolan.github.io/jq/download/).

# Sources
A lot of the configuration was drawn from two major sources:
1. https://sourabhbajaj.com/mac-setup/iTerm/zsh.html
2. https://tjay.dev/howto-my-terminal-shell-setup-hyper-js-zsh-starship/


