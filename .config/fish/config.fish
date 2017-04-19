# (Thanks @gf3)

set fish_greeting

. ~/.config/fish/z.fish

if test -e ~/.vars.fish
  . ~/.vars.fish
end

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
set -x EC2_HOME "/usr/local/ec2/ec2-api-tools-1.7.5.1"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_71.jdk/Contents/Home"

# Paths
test -d ~/bin           ; and set PATH ~/bin $PATH
test -d /usr/local/bin  ; and set PATH /usr/local/bin $PATH
test -d /usr/local/sbin ; and set PATH /usr/local/sbin $PATH
test -d "$EC2_HOME/bin" ; and set PATH "$EC2_HOME/bin" $PATH

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
function v. ; nvim . ; end
function vp ; nvim -p $argv ; end

# Git
function g      ; git $argv ; end
function ga     ; git add $argv ; end
function gaa    ; git add --all $argv ; end
function gb     ; git branch $argv ; end
function gcm    ; git commit -m $argv ; end
function gco    ; git checkout $argv ; end
function gcp    ; git cherry-pick $argv ; end
function gcf    ; git git clean -df ; end
function gclean ; git reset --hard; and git clean -dfx ; end
function gd     ; git diff ; end
function gdc    ; git diff --cached ; end
function gdt    ; git difftool ; end
function glgg   ; git log --graph --max-count=10 ; end
function glgga  ; git log --graph --decorate --all ; end
function glo    ; git log --oneline --decorate --color ; end
function glog   ; git log --oneline --decorate --color --graph ; end
function gst    ; git status ; end
function gl     ; git pull ; end
function glr    ; git pull --rebase ; end
function glro   ; git pull --rebase origin $argv; end
function glg    ; git log --stat --max-count=10 ; end
function gm     ; git merge $argv ; end
function gmt    ; git mergetool ; end
function gp     ; git push $argv ; end
function gpt    ; git push --tags ; end
function gr     ; git remote $argv ; end
function grb    ; git rebase $argv; end
function grbi   ; git rebase -i ; end
function grbc   ; git rebase --continue ; end
function grba   ; git rebase --abort ; end
function grbs   ; git rebase --skip ; end
function grh    ; git reset HEAD ; end
function grhh   ; git reset HEAD --hard ; end
function grv    ; git remote -v ; end
function gsta   ; git stash ; end
function gsp    ; git stash pop ; end
function gwc    ; git whatchanged -p --abbrev-commit --pretty=medium ; end

# Docker
function d  ; docker $argv; end
function di ; docker images $argv; end
function dm ; docker-machine $argv ; end
function dc ; docker-compose $argv ; end

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
function epi ; elm package install -y $argv ; end

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
