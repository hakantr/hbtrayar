set fish_greeting
set -x EDITOR hx
set -x TERMINAL alacritty
set -x PATH "$HOME/.cargo/bin" "$HOME/.local/bin" "/opt/homebrew/bin" "/opt/homebrew/sbin" "/usr/local/bin" "$PATH"
function gecmis
    builtin history --show-time='%F %T '
end

function yedek --argument filename
    cp $filename $filename.bak
end

function kopyala
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

function ll --wraps=ls --wraps=exa --description 'List contents of directory using exa tree'
    exa --tree --level=2 -a --long --header --accessed --git $argv
end

alias ls='exa --long --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons' # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'" # show only dotfiles
alias cat='bat --style header --style rule --style snip --style changes --style header'
alias zll="zellij"
alias rustz="zellij action new-tab -l /Users/hakanbiris/.config/zellij/layouts/rust.kdl"
