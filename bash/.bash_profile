#
# ~/.bash_profile
#
export DELTA_FEATURES=+side-by-side #activate
# GTK_IM_MODULE 주석처리하면 chromium에서 한글 입력 안됨.
# 환경변수들을 전역설정하면 hyprland의 kitty에서 한글 입력이
# 한번만 되고, kitty를 재실행하거나 하면 한글입력이 되지 않는
# 문제가 생긴다. ./config/hyprland.conf에서 환경변수를 선언해야
# kitty를 재시작해도 한글을 계속 입력할 수 있게 된다.
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx 
#export SDL_IM_MODULE=fcitx
#export GLFW_IM_MODULE=fcitx
#if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
#fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
