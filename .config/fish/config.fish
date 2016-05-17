# (Borrowed from @gf3)

set fish_greeting

set -x EDITOR nvim
set -x GREP_COLOR "1;37;45"
set -x JRUBYOPT "-Xcext.enabled=true"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x RBENV_ROOT /usr/local/var/rbenv
set -x RBXOPT -X19
set -x PRIVATE_KEY "$HOME/.ssh/id_rsa"
set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# Paths
test -d ~/bin           ; and set PATH ~/bin $PATH
test -d /usr/local/bin  ; and set PATH /usr/local/bin $PATH
test -d /usr/local/sbin ; and set PATH /usr/local/sbin $PATH

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function l     ; tree --dirsfirst -aFCNL 1 $argv ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Utilities
function d        ; du -h -d=1 $argv ; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function t        ; command tree -C $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end
function v        ; nvim $argv ; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end
