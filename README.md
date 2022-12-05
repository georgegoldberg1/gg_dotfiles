# Readme for dotfiles

Contains the configuration files normally placed in the ~/.config folder on MacOS.

## References/Guide:

This is mostly a recreation from Takuya Matsuyama's setup ([YouTube](https://www.youtube.com/watch?v=ajmK0ZNcM4Q&t=2233s&ab_channel=devaslife), [GitHub](https://github.com/craftzdog/dotfiles-public)), although I use the [pyright](https://github.com/microsoft/pyright) language server for LSP.

Also learned a bit more about LSP from [chris@machine](https://www.youtube.com/watch?v=b7OguLuaYvE&ab_channel=chris%40machine)

## Pre-setup

To make working on python in neovim easier, some features have been included that require extra installs.

# Mac setup

Create dotfiles/ directory in your home
Put config files here and symlink to home directory. Eg
ln -s ~/dotfiles/.zshrc ~/.zshrc

## Command line tools for mac

xcode-select --install

## install homebrew

(non language specific package manager for mac)
Go to their website. Google "homebrew". Download and follow install instructions. The "brew " command should now be available in the terminal. (brew install packagex) etc

USE a "Brewfile" in dotfiles.. "brew bundle dump" to create THEN "brew bundle --force cleanup" (brew bundle is similar to pip list or conda list brewfile similar to requirements file. It creates a list of the installed packages allowing to setup other laptops quickly for workspace consistency.

## terminal app

brew install iTerm2 --cask

## git

brew install git

## fish shell ("Friendly interactive shell")

it’s supposed to be faster than Zsh.

### fish basic settings

brew install fish
tmp=$(which fish)
sudo sh -c 'echo '$tmp' >> /etc/shells'
chsh -s $(which fish)
Restart terminal

### fish plugins Fisher https://github.com/jorgebucaran/fisher

faster shell startup than "oh-my-fish"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install oh-my-fish/theme-bobthefish https://github.com/oh-my-fish/theme-bobthefish
brew install exa (better version of "ls" command) then out a config-osx.fish file in ~/.config/fish/

(OR zsh chsh /bin/zsh AND oh-my-zsh and powerline 10k (P10k config))

### setup aliases

alias gs='git status'
fish_add_path --prepend /opt/homebrew/bin
fish_add_path --prepend /opt/homebrew/sbin
fish_add_path --append ~/.local/bin

## tmux

Brew install tmux
.tmux.conf file
tmux powerline config file
tmux ide layout aliases in ~/.local/bin and set each permissions chmod 755 (owner|group|other = read(4)+write(2)+exec(1) | read(4)+exec(1) | read(4)+exec(1))

## neovim

- `brew install neovim luajit tree-sitter` (if not using Neovim "mason" pluging, then also brew install pyright for python language server)
- sudo ln -s (which nvim) /usr/local/bin/vim
- Install "packer" manager for nvim.
- git clone --depth 1 https://GitHub.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
- Neosolarized colors
- Lualine for statusline

- And nvim/plugin/lspconfig.lua
- And nvim/after/plugin/ .rc.lua files
- (neovim) :PackerInstall
- (neovim) :PackerUpdate
- (neovim) :TSUpdate (treesitter)

Key maps for lsp set up in nvim/plugin/lspconfig: Shift K (capital K) for python documentation when cursor over a function), gD for go to function definition, gi for go to implementations.
￼
And lspsaga.rc.lua

## karibiner elements for keyboard

Brew install karabiner-elements --cask (for mapping keys)??? He swaps caps lock with control key. Can set up fn + h j k l as arrows (so you can use vim practice in other apps like Jupyter to get used to it faster)
Inkdrop is the name of this guys paid markdown app (devaslife YouTuber) Takuya Matsuyama from Japan.

## fonts etc

- Install powerline nerd fonts
- Solarised dark theme
- Use dark background so you can add transparency and blur without it being distracting

Tmux bash script in home /.local/bin/ and add To path and Chmod 755 on any scripts

## vim bindings and shortcuts

## vim macro
macro q to start, then letter to register, then commands, then q to stop. then num@registeredletter to use (where num= number of rows to apply to)
eg qa I--Esc q and 1@a would insert two dashes at the beggining of the line to comment out SQL 2@a would run it on 2 lines

## conda setup

conda init (in fish shell)

Neovims LSP plugins and "mason" lsp plugins handle the language servers. I've set one up for python and for lua, meaning it will understand these languages.
These are installed automatically by neovim plugin "mason", but to install manually: `brew install pyright` and `brew install lua-language-server`

for code formatting, these are installed inside python environments for each project:

`conda install flake8 black`

and for non python files eg yml, json, markdown and more:
`brew install fsouza/prettierd/prettierd`

Best to use the python specifics for python as they'll nail those bits better.

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

# fish shell

and use with "EXA" can be be installed via homebrew and allows the displaying of "ls" alternatives with fish shell.

Requires Neovim 0.8

**Last updated Nov 2022**
