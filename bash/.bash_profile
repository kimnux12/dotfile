#
# ~/.bash_profile
#
export DELTA_FEATURES=+side-by-side #activate
export GTK_IM_MODULE=kime
export QT_IM_MODULE=kime
export XMODIFIERS=@im=kime 
export GLFW_IM_MODULE=kime
export PATH="/home/kimnux/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/kimnux/perl5/lib/5.38.2${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/kimnux/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/kimnux/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/kimnux/perl5"

[[ -f ~/.bashrc ]] && . ~/.bashrc
