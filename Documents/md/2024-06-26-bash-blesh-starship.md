---
title: "bash를 편하고 이쁘게"
date: 2024-06-26
layout: single
tags:
    - bash
    - starship
    - ble.sh
    - eza
---
# 터미널 꾸미기  

리눅스를 공부를 위해서든, 취미로 사용하기 위함이든,  
따로 꾸며진 배포판을 설치한 게 아니라면 처음 마주치는  
터미널의 프롬프트 모양은 매우 단조로운 게 사실이다.  

게다가 zsh이나 fish를 설치했다가 bash 공부를 하고자 할 때,  
다른 쉘의 경우 bash와는 다소 다르게 작동하는 경우가 있어,  
이쁘고 편한 쉘을 놔두고 다시 bash로 설치하는 경우도 있을것이다.  

배우는 입장에서는 기본을 따르는 게 제일 좋기도 하고,  
편리함과 알록달록 이쁘기도 해서 현재 bash에서 사용중인 조합을 적어볼까한다.  

![screenshot](/assets/images/2024-06-26-124531_hyprshot.png)  
색상은 사용하는 터미널의 테마에 따라 조금씩 다르게 나올 수 있다.  
(위의 스크린샷은 foot terminal의 catppuccin 테마)  

**starship**, **ble.sh**, **eza** 3가지가 바로 그것들이다.  

<b><span style="font-size:150%">1. starship</span></b>  
링크 : <https://starship.rs>  
터미널 프롬프트를 꾸밀 수 있는 프로그램이다.  
명령어를 자잘자잘하게 많이 사용하는 경우,  
단순한 형태가 번잡하지 않고 git 변경내용등을 보기 편하다.  
현재 내가 사용 중인 환경구성파일은 [여기](https://github.com/kimnux12/dotfile/tree/dotfiles/.config)에 있다.  

<b><span style="font-size:150%">2. ble.sh</span></b>  
링크 : <https://github.com/akinomyoga/ble.sh>  
zsh이나 fish에서처럼 가장 핵심적인 기능인 *자동완성기능*과, *syntax highlighting* 등이 있다.  
이 프로그램때문에 터미널에서 타자치는게 엄청나게 편해진다.  
tab키 하나가 꽤나 많은 일을 해낸다.  

<b><span style="font-size:150%">3. eza</span></b>  
링크 : <https://github.com/eza-community/eza>  
칼라풀한 ls 명령어라고 할 수 있다.  
starship과 함께 사용하면 이쁘게 꾸며진 터미널을 볼 수 있을것이다.  
bashrc 파일에 원하는 구성으로 alias를 만들어주면 편하다.  
```
alias ls='eza --sort=type --icons=auto --git'
```
