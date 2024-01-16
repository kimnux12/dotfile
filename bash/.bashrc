#
# ~/.bashrc
#
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach
#old_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"
export TERM=xterm-256color
unset MANPATH
#[[ $- != *i* ]] && return
eval "$(starship init bash)"
alias vi='vim'
alias ls='colorls --sd --gs -a'
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTCONTROL=ignorespace
alias rm='rm -i'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
export XDG_RUNTIME_DIR=/run/user/1000
alias en='export LANG=en_US.UTF-8'
alias ko='export LANG=ko_KR.UTF-8'
alias startx='export LANG=ko_KR.UTF-8;startx'
#====== docker-compose alias =====
alias dockerc='docker-compose'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'  # -v를하면 postgres의 data가 날아감
#================================
[[ ${BLE_VERSION-} ]] && ble-attach
