

# org mode 단축키 모음

😆😁😀

## 문서 작업 관련

### 새 버퍼(문서) 만들기

SPC b N

### 새 버퍼(문서) 만들기 / 버퍼간 이동

C-x b

### 파일 찾기

SPC f f

### 이전 버퍼

SPC b p

### 다음 버퍼

SPC b n

### switch buffer

SPC b B

### clone buffer

SPC b c

### 문서 변환해서 내보내기(org-pandoc-export)

SPC m e

### export dispatcher 이용해서 내보내기(org-export-dispatch)

C-c C-e (<https://orgmode.org/manual/The-Export-Dispatcher.html#The-Export-Dispatcher>)

### 최근 작업한 문서들 나열

SPC f r

### 버퍼 끄기(문서 종료)

SPC b k

### Switch Buffer(버퍼 나열)

SPC b B

### 버퍼 저장하기

SPC f s

### 다른이름으로 저장하기

SPC f S

### 주석표시(;;) 일괄표시, 삭제

M-;

## Doom emacs 관련

### Run Command(M-x)

SPC :

### 설정파일 열기

SPC f p

### 터미널 열기

SPC o t

### 이맥스 재실행

SPC q r

### 이맥스 종료

SPC q q

### 이맥스 종표(emacsclient로 실행한 경우)

SPC q f

### doom sync/doom reload

SPC h r r

### List Errors

SCP c x

### Next Error

]e

### Previous Error

[e

### Switch Project(프로젝트 나열)

SPC p p

### 프로젝트내의 파일찾기

SPC SPC (SPC p f)

### 새 프로젝트 등록하기

SPC p a

### 테마 보기

SPC h t

## Window management

The following keys are all available under SPCw as well, if you prefer.   
Key 	Description   
**C-ws**  Split the window horizontally   
**C-wv**  Split the window vertically   
**C-wd**  Delete current window   
**C-w {h,j,k,l}**  Select window in direction (left, below, above, right, respectively)   
**C-w {S-h,S-j,S-k,S-l}**  Swap current window with window in direction   
**C-w {C-S-h,C-S-j,C-S-k,C-S-l}**  Move current window to edge of frame in direction  
**C-wu or C-wC-r**  Undo or redo last change to window configuration   
**C-wo**  Enlargen current window. Again to undo.   
**C-wmm**  Delete other windows. Again to undo.   
**{N}C-w|**  Change width of current window to N (a number)   
**{N}C-w\_**  Change height of current window to N lines   

Doom emacs의 명령어

**SPC w v** window split vertically   
**SPC w s** window split horizontally   
**SPC w w** to switch windows   
**SPC w q** to close window, frame, quit EMACS if last frame   
**SPC w +** and **SPC w -** to increase and decrease window height   
**SPC w >** and **SPC w <** to increase and decrease window width   

You can use vim motion keys to navigate between open windows for example SPC w H moves the window to the left.   
Windows are panes in your screen

