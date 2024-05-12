if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias genpass='bash $HOME/.config/utils/genpass.sh'


# aliases
if type -q exa
		alias lA "exa -l --icons --time-style=long-iso"
		alias ll "exa -l --no-filesize --icons --no-user -RTL=1 --git --group-directories-first --no-permissions --time-style long-iso"
    #		alias ll "lA --no-user --no-permissions --no-time"
		alias lla "lA -g --octal-permissions -a"
    alias llt "ll -TRL=1"
    alias llta "ll -TR"
    alias llmod "lA --no-user --no-permissions --time=modified --sort=time --reverse"
		alias llcreate "lA --no-user --no-permissions --time=created --sort=time --reverse"
		alias llopen "lA --no-user --no-permissions --time=accessed --sort=time --reverse"
    # alias ll "exa -l -g --icons"
    # alias lla "ll -a"
else
    alias ll "ls -l"
    alias la "ll -a"
end

alias ls "ls -p -G"
alias g git
alias gs='git status'
#alias gh='git log'
alias gh="git log --date=format:'%Y-%m-%d|%H:%M:%S' --format='%ad|%an|%s'"
alias gt="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all"

alias gitchart="bash $HOME/.config/utils/gitlog.sh"

alias vi='nvim'
alias red_tree="tree -I '*.pyc' -I '__pycache'"

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

fish_add_path --prepend /opt/homebrew/anaconda3/bin
fish_add_path --prepend /opt/homebrew/sbin
fish_add_path --append ~/.local/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


source ~/.docker/init-fish.sh || true # Added by Docker Desktop
