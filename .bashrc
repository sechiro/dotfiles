alias ls='ls -F'
alias ll='ls -l'
alias alert_grep='grep -i -e warn -e error -e fail -e fatal'
export PATH=$PATH:/Applications/MacVim.app/Contents/MacOS:~/bin
export HISTSIZE=1000000
export PS1
export PS2
export PS4
#source ~/.perlbrew/etc/bashrc
alias d='pushd'
alias p='popd'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export AWS_CONFIG_FILE=~/.aws/config
complete -C aws_completer aws

alias dstat-extra='dstat -Tclmdrn --top-cpu --top-cputime --top-io --top-latency'
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'

source fabric-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
export PATH=$PATH:~/bin

_replace_by_history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
  local l=$(HISTTIMEFORMAT= history | $tac | perl -pe 's/^\s*[0-9]+\s+//' | percol --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}
if [ ${BASH_VERSINFO[0]} = 4 ];then
  bind -x '"\C-r": _replace_by_history'
  bind    '"\C-xr": reverse-search-history'
fi


