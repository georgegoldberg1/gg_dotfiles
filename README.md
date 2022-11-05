# Readme for dotfiles

Contains the configuration files normally placed in the ~/.config folder on MacOS.

## References/Guide:

This is mostly a recreation from Takuya Matsuyama's setup ([YouTube](https://www.youtube.com/watch?v=ajmK0ZNcM4Q&t=2233s&ab_channel=devaslife), [GitHub](https://github.com/craftzdog/dotfiles-public)), although I use the [pyright](https://github.com/microsoft/pyright) language server for LSP. 

## Setup

1. Clone the repo
2. Symbolic link the repo .config folder to the home directory  
`ln -s gg_dotfiles/.config ~/`
3. Create symbolic links for some of the config files where neccesary:  
`ln -s .config/tmux/tmux.conf ~/.tmux.conf`  
`ln -s .config/vim/.vimrc ~/.vimrc`  
`ln -s .config/zsh/.zshrc ~/.zshrc`  
`ln -s .config/powerline10k_zsh/.p10k.zsh ~/.p10k.zsh`  
4. optional: change shell to fish shell `chsh $(which fish)`. make sure it's in /etc/shells first `echo $(which fish) >> /etc/shells`
5. Restart terminal

Requires Neovim 0.8

**Last updated Nov 2022**
