# (Thanks @gf3)

set fish_greeting

. ~/.config/fish/z.fish

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
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function t        ; command tree -C $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end
function gz       ; tar -zcvf $argv ; end

# Neovim
function v  ; nvim $argv ; end
function vp ; nvim -p $argv ; end

# Git
function g      ; git $argv ; end
function gd     ; git diff ; end
function gdc    ; git diff --cached ; end
function gl     ; git pull ; end
function gup    ; git pull --rebase ; end
function gp     ; git push ; end
function gcm    ; git commit -m $argv ; end
function gco    ; git checkout $argv ; end
function gr     ; git remote $argv ; end
function grv    ; git remote -v ; end
function gsta   ; git stash ; end
function gsp    ; git stash pop ; end
function grb    ; git rebase ; end
function grbi   ; git rebase -i ; end
function grbc   ; git rebase --continue ; end
function grba   ; git rebase --abort ; end
function gb     ; git branch $argv ; end
function gcp    ; git cherry-pick $argv ; end
function glg    ; git log --stat --max-count=10 ; end
function glgg   ; git log --graph --max-count=10 ; end
function glgga  ; git log --graph --decorate --all ; end
function glo    ; git log --oneline --decorate --color ; end
function glog   ; git log --oneline --decorate --color --graph ; end
function gst    ; git status ; end
function ga     ; git add $argv ; end
function gaa    ; git add --all $argv ; end
function gm     ; git merge $argv ; end
function gmt    ; git mergetool ; end
function gdt    ; git difftool ; end
function grh    ; git reset HEAD ; end
function grhh   ; git reset HEAD --hard ; end
function gclean ; git reset --hard; and git clean -dfx ; end
function gwc    ; git whatchanged -p --abbrev-commit --pretty=medium ; end

# Vagrant
function vu   ; vagrant up ; end
function vh   ; vagrant halt ; end
function vs   ; vagrant status ; end
function vsh  ; vagrant ssh ; end
function vsus ; vagrant suspend ; end
function vres ; vagrant resume ; end
function vr   ; vagrant reload ; end
function vrp  ; vagrant reload --provision ; end
function vpro ; vagrant provision ; end

# NPM
function ni   ; npm i $argv ; end
function nis  ; npm i -S $argv ; end
function nisd ; npm i -D $argv ; end
function nu   ; npm un $argv ; end
function nus  ; npm un -S $argv ; end
function nusd ; npm un -D $argv ; end
function nr   ; npm run $argv ; end

# Elm
function epi ; elm package install -y ; end

# Start mongo as daemon
function mongodd ; mongod --fork --logpath /data/log/mongodb.log ; end


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
