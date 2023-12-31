#
# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac
#old_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"

#export PATH="~/.pyenv/bin:$old_path"
#--------PYTHON용 셋팅----------------
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="~/.pyenv/versions/3.12.0/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv virtualenv-init -)"
export TERM=xterm-256color
unset MANPATH
#[[ $- != *i* ]] && return
eval "$(starship init bash)"
alias vi='vim'
alias ls='colorls --sd --gs -a'
#alias ls='lsd'
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTCONTROL=ignorespace
alias rm='rm -i'
alias grep='grep --color=auto'
#alias cat='lolcat -t'
#PS1='[\u@\h \W]\$ '
source ~/.local/share/blesh/ble.sh
export XDG_RUNTIME_DIR=/run/user/1000
alias en='export LANG=en_US.UTF-8'
alias ko='export LANG=ko_KR.UTF-8'
alias startx='export LANG=ko_KR.UTF-8;startx'
#====== docker-compose alias =====
alias dockerc='docker-compose'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'  # -v를하면 postgres의 data가 날아감
#================================
#PATH="/home/kimnux/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/kimnux/perl5/lib/5.38.2${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/kimnux/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/kimnux/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/kimnux/perl5"; export PERL_MM_OPT;
#fortune | cowsay | lolcat
