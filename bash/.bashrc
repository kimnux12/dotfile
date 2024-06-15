#
# ~/.bashrc
#
export TERM=xterm-256color
eval "$(starship init bash)"
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach
[[ ${BLE_VERSION-} ]] && ble-attach
#old_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"
#if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
#then
	#shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	#exec fish $LOGIN_OPTION
#fi
unset MANPATH
#[[ $- != *i* ]] && return
alias vi='vim'
#alias ls='colorls --sd --gs -a'
#alias ls='lsd -h --git --group-dirs=first'
alias ls='eza --sort=type --icons=auto --git'
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTCONTROL=ignorespace
alias rm='rm -i'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\e[?25l\e[?1c' 
#export XDG_RUNTIME_DIR=/run/user/1000
alias en='export LANG=en_US.UTF-8'
alias ko='export LANG=ko_KR.UTF-8'
alias hy='Hyprland'
#alias startx='export LANG=ko_KR.UTF-8;startx'
#====== docker-compose alias =====
alias dockerc='docker-compose'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'  # -v를하면 postgres의 data가 날아감
#------------------------------------------------------------------------------------
#export DENO_UNSTABLE_BARE_NODE_BUILTINS=true
#------------------------------------------------------------------------------------
#PATH="/home/kimnux/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/kimnux/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/kimnux/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/kimnux/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/kimnux/perl5"; export PERL_MM_OPT;
#export API_KEY=UFtCH8oDgiX6Pe6BDH09l3RG4DmVox08MZJGfuAH
