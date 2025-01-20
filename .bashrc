#
# ~/.bashrc
#
export EDITOR=vim
export TERM=xterm-256color
eval "$(starship init bash)"
[[ $- == *i* ]] && source /home/kimnux/.local/share/blesh/ble.sh --noattach
[[ ${BLE_VERSION-} ]] && ble-attach
#old_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"
#if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
#then
	#shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	#exec fish $LOGIN_OPTION
#fi
unset MANPATH
#[[ $- != *i* ]] && return
alias mpv='mpv --hwdec=vaapi --vo=gpu'
alias vi='vim'
alias cat='bat'
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
# fzf settings
# Use ~~ as the trigger sequence instead of the default **
shell="$(basename $SHELL)"
eval "$(fzf --$shell)"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='find . -type d \( -name node_modules -o -name .git \) -prune -o -type f -print'
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
#------------------------------------------------------------------------------------
#export DENO_UNSTABLE_BARE_NODE_BUILTINS=true
#------------------------------------------------------------------------------------
#PATH="/home/kimnux/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/kimnux/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/kimnux/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/kimnux/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/kimnux/perl5"; export PERL_MM_OPT;
#export API_KEY=UFtCH8oDgiX6Pe6BDH09l3RG4DmVox08MZJGfuAH
export PATH="$PATH:$GEM_HOME/bin:~/.cargo/bin:~/.config/emacs/bin"
# emacs용 vterm 설정
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    function clear() {
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    }
fi
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'echo -ne "\033]0;${HOSTNAME}:${PWD}\007"'
vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'
# fastfetch --config ascii-art
