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

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias gs='git status'
alias gh='git log'
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
eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

