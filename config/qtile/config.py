# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#from typing import List
import os  # https://docs.qtile.org/en/latest/manual/config/hooks.html 참고
import random
import subprocess # os, subprocess, import hook은 autostart.sh 불러오기용.
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import base # https://docs.qtile.org/en/latest/_modules/libqtile/widget/wallpaper.html#Wallpaper
from libqtile.log_utils import logger
from pathlib import Path

# Get home path
#home = str(Path.home())

mod = "mod4"
terminal = "terminator"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    #
    #Key([mod], "p", lazy.spawn("cmus-remote -p ~/Music")),
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
    #
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
#    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
#    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
#    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
#    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # lazy.layout.grow_함수들은 MonadTall 형식에선 작동하지 않는다.(Qtile wiki참고)
#    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
#    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
#    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
#    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "control"], "h", lazy.layout.grow()),
    Key([mod, "control"], "l", lazy.layout.shrink()),
    Key([mod, "control"], "j", lazy.layout.normalize()),
    Key([mod, "control"], "k", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    #Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    #Key([mod], "u", lazy.spawn("radiotray-ng")),
    Key([mod],"Tab", lazy.spawn("rofi -show drun -show-icons"))
    # 제일 마지막에는 ,를 쓰면 안됨!!!

##############################################
############## SCREENSHOTS ###################
##############################################

   # Key(["shift"], "Print", lazy.spawn("clip")),
   # Key([mod], "Print", lazy.spawn("crop")),
   # Key([], "Print", lazy.spawn("shot"))
    
###############################################

]


groups = [Group(i) for i in "123"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.MonadTall(border_focus="#e34d70",
                     border_normal="#242223",
                     new_client_position="bottom",
                     #ratio=0.5,
                     margin=3,
                     border_width=3),

#    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], 
                   #boder_normal_stack=["#ffffff", "#ebe6e6"],
                   #boder_normal=["#ffffff", "#ebe6e6"], 
                   #margin=3, 
                   #border_width=2),
    
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    layout.Zoomy()
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        # 바탕화면 하나만 계속 띄울거면, 여기에 wallpaper를 불러오면됨
        #wallpaper = '~/wallpapers/maple.jpg',wallpaper_mode='fill',
        top=bar.Bar(
            [
                #widget.CurrentLayout(),
                widget.GroupBox(highlight_method='block'),
                #widget.Prompt(),
                widget.Spacer(length=1000),    # 활성화된 윈도우 이름 정렬시 widget.Tasklist 살펴봐야할듯.
                widget.WindowName(max_chars=30),
                #widget.Spacer(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                #widget.TextBox("default config", name="default"),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                # witget.Wapllpaper()는 bar에 그림들 이름을 띄워주고
                # 이름을 누르면 계속 바탕화면을 바꿔서 띄워주는 역할을 한다.

                #widget.Systray(), # systray가 뭐하는건지 아직 모름.
                widget.Cmus(
                    width=90,
                    scroll=True,
                    scroll_fixed_width=True,
                    scroll_repeat=True,
                    scroll_delay=0.5,
                    play_color = 'fffcff',
                    noplay_color = '4c4a4d',
                    max_chars =25,
                    #fmt='  : {}', 
                    padding=8, 
                    format = '{play_icon} {artist}-{title}'
                ),
                # 2023.10.22일 현재 wighet.Wallpaper는 feh를 설치해야 작동한다.!!!!
                # 이이상한게 경로를 반드시 홈디렉토리에 /Picures/wallpapers를 만들고
                #거기에 그림파일들을 집어넣어야 한다.???? feh 설정을 봐야할듯.
                # feh 설치하면 ~/.fehgb가 생성되고 거기에 임의의 경로가 적혀있는데 바꿔도 경로 설정이 안된다.
                #무조건 ~/Pictures/wallpapers 인가??
                widget.Wallpaper(      
                    #fmt = '  : {}',   
                    #fmt = ' 🅆🄰🄻🄻🄿🄰🄿🄴🅁 : {}',
                    directory='~/wallpapers/',
                    #wallpaper_command=['feh', '--bg-fill'],             
                    label='🅆🄰🄻🄻🄿🄰🄿🄴🅁',
                    #max_chars=18,
                    #이 디렉토리에 지정과 상관없이 feh가정한 디폴트 디렉토리에 넣어야 그림 바뀜
                    #2023.10.27 위에 소리 다 필요없고 변수가 Directory가 아니라 directory이다. 대소문자 구분안해서 벌어진 일임.
                    #대소문자 구분 잘 할것!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
                    random_selection=True
                    #option='fill'             
                    #wallpaper_command=['feh', '--bg-fill']
                ),
                #widget.TextBox(
                #    fmt = '   Wallpaer ',
                #    padding = 10,
                #    foreground='fffcff',
                #    mouse_callbacks={
                #        "Button1":
                #    lazy.spawn("feh ~/wallpapers")
                #        }
                #    ),

                #widget.TextBox(    # wireplumber 대신 pipewire-media-session 설치해서 볼륨조절창 불러오기
                #    fmt=' 🔊 ',
                #    padding=10,
                #    foreground='#6baf69',           
                #    mouse_callbacks={
                #        "Button1":
                #        lazy.spawn("pavucontrol")
                #        }
                #),                    
                widget.Volume(padding=10, fmt="󰕾 {}"),   # wireplumber 오류로 10.24일현재 작동 안함
                # 10.27일 현재 pulse-audio, pipewire-pulse 지우고 widget.volume 정상 작동.
                # 우분투 22.10 버전의 경우 pulse audo를 버리고 pipewire 채택. 기존 pulse audio와의
                # 호환을 위해 pipewire-pulse를 추가적으로 설치했다고 함.
                #widget.ThermalSensor(threshold=87,fmt='CPU:{}'),
                widget.Memory(
                        padding=5,
                        fmt="🄼🄴🄼  {}",
                        measure_mem='G',
                        foreground='fffcff'
                        ),
                widget.Memory(
                        padding=5,
                        measure_swap='G',
                        format='🅂🅆🄰🄿  {SwapUsed: .0f}{ms}/{SwapTotal: .0f}{ms}',
                        foreground='fffcff'
                        ),
                widget.ThermalSensor(
                    padding=5,
                    update_interval=1,
                    format="󰔐 {temp:.0f}{unit}"
                    #tag_sensor="Tctl",
                    #foreground=gruvbox["cream"],
                    #background=gruvbox["blue-alt"],
                    #**slash_powerlineRight,
                ),
                #widget.CPUGraph(core='6'),
                widget.CPUGraph(core='all', border_color='fffcff', graph_color='fffcff'),
                widget.Clock(
                    format="%m-%d %a %I:%M %p",
                    font='Noto Sans',
                    foreground='#ffffff'
                ),
                #widget.Systray(),
                widget.TextBox(
                    foreground = '#cf255e',
                    fmt='⏻  ',   # https://www.nerdfonts.com/cheat-sheet에서 원하는 icon검색해서 사용.
                    padding=10,
                    mouse_callbacks={
                        "Button1":
                        lazy.spawn("rofi -show power-menu -modi power-menu:~/.config/qtile/rofi-power-menu")
                        }
                ),
                #widget.QuickExit(),
            ],
            24,
            #opacity=0.7
            background = "#ad69af00" #맨뒤에 00이 투명도 조절 헥사코드임..앞에 두개가 아니라..ㅜㅜ
            #margin=[10,6,4,6],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
      # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
#wl_input_rules = None

# Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@hook.subscribe.startup
def autostart():
    subprocess.Popen(["picom"])
