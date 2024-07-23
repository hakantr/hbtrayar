set fish_greeting
set -x EDITOR hx
set -x TERMINAL alacritty
set -x PATH "$HOME/.cargo/bin" "$HOME/.local/bin" /opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin "$PATH"
set -x RUSTFLAGS -Awarnings
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

alias cat='bat --style header --style rule --style snip --style changes --style header'
