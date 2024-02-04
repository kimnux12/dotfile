"#--------------------------------------------------------------
"#
"#     pacman으로 vundle을 설치하면 git으로 받은것과 충돌남.
"#     gvim 설치시에 설치될 수도 있으니 꼭 pacman으로 vundle
"#     삭제할것. 삭제하지 않으면 PluginInstall 시에 에러발생함.
"#
"#--------------------------------------------------------------
"vim tool 쉽게 설치하려고 번들 만드는 과정에서 코드 추가.
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"----- ColorScheme용 플러그인들--------------------
Plugin 'gilgigilgil/anderson.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'catppuccin/vim', { 'as': 'catppuccin' } 
Plugin 'junegunn/seoul256.vim'
Plugin 'EdenEast/nightfox.nvim'
"Plugin 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
"Plugin 'thaerkh/vim-indentguides'
Plugin 'markonm/traces.vim' "perldo는 지원안함.highlights patterns and ranges. ex편집기기준이라 BRE만 지원하는듯.
"Plugin 'nordtheme/vim'
Plugin 'mattn/emmet-vim' " <! 쓰고 ctrl+y , 누르면 기본 html 구조들을 만드는 플러그인
"Plugin 'KabbAmine/vCoolor.vim' "칼라 선택창 표시기능
"Plugin 'Raimondi/delimitMate' "괄호 자동생성
"Regex 하이라이트 플러그인
Plugin 'Galicarnax/vim-regex-syntax'
Plugin 'ap/vim-css-color'  "color name highlight"
"Plugin 'ervandew/supertab'
Plugin 'ryanoasis/vim-devicons' "파일타입에 맞춰 아이콘 표시
"Makr 표시기능
Plugin 'kshenoy/vim-signature'
"각종 언어 하이라이트 자동들여쓰기등 지원 
Plugin 'sheerun/vim-polyglot'
"sysntax hightlight 플러그인
Plugin 'AndrewRadev/tagalong.vim'
"================================================
" 빠른 insert mode 탈출 플러그인
Plugin 'jdhao/better-escape.vim'
"--------------------------------------------------
"vim용 live-server
Plugin 'https://github.com/wolandark/vim-live-server.git' " StartBrowerSync(localhost:3000),KillBrowerSync
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'mattn/vim-lsp-settings'
"Plugin 'Exafunction/codeium.vim'
"Plugin 'dense-analysis/ale' " ALE : syntax 체크와 구문 에러 지원
"Plugin 'rhysd/vim-lsp-ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'  "향상된 괄호 표시
"Plugin 'othree/eregex.vim'   "검색명령어 /를 누르면 perl regex로 검색되도록 함.traces와 호환안됨.
"----------------------------------------------
" Docker 지원 플러그인 셋팅 (deno 필요)
Plugin 'vim-denops/denops.vim'    "선행 플러그인
Plugin 'skanehira/denops-docker.vim'
"--------------------------------------------------
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rhubarb'   "GBrowse 로 git폴더내의 작업파일의 해당 gitHub 인터넷페이지 오픈
Plugin 'junegunn/gv.vim'     "A git commit browser
Plugin 'airblade/vim-gitgutter'  "quickly jump between “modified git chunks” and to operate upon those chunks
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " 자동완성기능들과 사용시 c-n
"작동 방해한다.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"packadd YouCompleteMe
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-----------------------------------------------------------------------------------------------
"빠른 INSERT 모드 탈출
let g:better_escape_shortcut = 'jj'
let g:better_escape_interval = 200

" 24bit color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"set t_Co=256
" delimitMate
let delimitMate_expand_cr=1
"coc=vimlsp용 세팅
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" regex-syntax용
au FileType python call EnableEmbeddedSyntaxHighlight('pcre', "\\v\\C<R''@!", "\\v([^\\\\]\\\\(\\\\\\\\)*)@<!'", 'Comment')
au FileType lua call EnableEmbeddedSyntaxHighlight('pcre', "\\[=\\[", "\\]=\\]", 'Comment')


" emmet용 셋팅
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {
\  'variables': {'lang': 'ko'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
"gitgutter용 셋팅: Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
"highlight SignColumn guibg=bg
"highlight SignColumn ctermbg=bg
"-----------------------------------------------------------------------------------------------
set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes

" ------------------------------------------
" Tab - 위아래 이동
" Ctrl+Space - 선택
" \b - 지시자 제거, 기존 자동완성 양식 폐기
"  ------------------------------------------
" Supertab용 셋팅
"let g:SuperTabCrMapping=1
" <Tab> 을 눌러서 현재 지시자를 옮김.
inoremap <silent><expr> <TAB>
   \ coc#pum#visible() ? coc#pum#next(1) :
   \ CheckBackspace() ? "\<Tab>" :
   \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
						   \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"-----------------------------------------------------
nmap <F3> :StartBrowserSync <CR>
nmap <F4> :KillBrowserSync <CR>
"-----------------------------------------------------
"let g:codeium_disable_bindings = 1
"imap <script><silent><nowait><expr> <C-g> codeium#Accept()
"imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
"imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
"imap <C-x>   <Cmd>call codeium#Clear()<CR>
"-----------------------------------------------------------------------------------------------
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)
"---------------------------------------------------------
"탐색기 불러내고 닫기
inoremap <F5> <ESC>:Lex<cr>:vertical resize 30<cr>
nnoremap <F5> <ESC>:Lex<cr>:vertical resize 30<cr>

set shortmess+=c

set complete+=kspell   "자동완성기능 추가
set completeopt=menuone,longest

set clipboard=unnamedplus,unnamed
set nu " 줄번호
set number relativenumber
"set autoindent "자동 들여쓰기
set scrolloff=2
"bash 자동완성처럼 명령어 일부만 치면 비슷한 이름 보여주는 기능
"set wildmenu
"set wildmode=longest:list,full
"set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 "스크롤바 너비
set autowrite "다른 파일로 넘어갈 때 자동 저장
set autoread "작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent "C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 "자동 들여쓰기 너비 설정
set showmatch "일치하는 괄호 하이라이팅
set smartcase "검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler "현재 커서 위치 표시
" highlight current line
set cursorline 
"highlight Cursorline cterm=bold ctermbg=black
set incsearch
set hlsearch "검색어 하이라이팅
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
"set nowrap

"coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" 범위 지정해서 <leader>f로 prettier 실행, javascript typesctript만 지원함.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
	set encoding=utf-8
	set fileencoding=utf-8
	set termencoding=utf-8
            "혹은 위 두줄 대신
            "set fileencoding=korea
endif
" 구문 강조 사용
if exists("syntax_on")
	syntax reset
endif
"터미널 창 열기(수평,수직)
" ctrl+(w,n)으로 최대화, i로 다시 원래 크키로 돌아옴.
function! Term(...)
	if a:0 == 0
		term ++rows=12
	else
		execute "term ++rows=".a:1
	endif
endfunction

function! Vterm(...)
	if a:0 == 0
		vert term
	else
		execute "vert term ++cols=".a:1
	endif
endfunction

command -nargs=? Term call Term(<f-args>)
command -nargs=? Vterm call Vterm(<f-args>)

"let g:highlightedyank_highlight_duration = 1000
set splitbelow
" rainbow 활성화
let g:rainbow_active = 1
" 배쉬 하이라이트 강제 적용
let g:is_bash=1
"filetype on
"set filetype=sh
"----------------------------------------------------------------------------
"ale용 설정
"let g:ale_completion_enabled = 0 " ALE에서 지원하는 자동완성기능
" Set this variable to 1 to fix files when you save them.
"let g:ale_fix_on_save = 1
"let g:ale_sign_error = '✘'
"let g:ale_sign_warning = '⚠'
"let g:ale_sign_error = '--'
"let g:ale_sign_warning = '>>'
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"highlight link ALEVirtualTextError Error
"
" ------------------------------------------------------------------------------
" 버퍼 목록 켜기
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.

let mapleader=","   "leader키 설정, 기본값은 \이다 

" 버퍼 새로 열기
"nmap <leader>T :enew<cr>
nmap <F2> :enew<cr>

" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>

" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
nmap <leader>bq :bp <BAR> bd #<CR>

" 모든 버퍼와 각 버퍼 상태 출력
nmap <leader>bl :ls<CR>
"---- grubbox 용 셋팅
"let g:gruvbox_contrast_dark="hard"
"set background=dark

"---- Tokyo Night 용 셋팅
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 0
"---- eliminating delay on ESC
set timeoutlen=1000 ttimeoutlen=0

"----- airline용 셋팅---------------------------------
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "버퍼 목록 켜기 let g:airline#extensions#tabline#fnamemod = ':t'  "버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1 "버퍼 번호 표시
let g:airline#extensions#tabline#buffer_nr_format = '%s:' "버퍼 번호포맷 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_highlighting_cache = 1

let g:airline_powerline_fonts = 1
let g:airline_theme = "tokyonight"
"let g:airline_theme = "catppuccin_mocha"
"let g:airline_theme= 'violet'
"let g:airline_solarized_bg='dark'
let g:airline_section_y = '' 
let g:airline_section_warning= '' "마지막 status창 사용 안함
set hidden
"-----------------------------------------------------
let g:rustfmt_autosave = 1
"검색을 정규식으로
map / /\v

"colorscheme catppuccin_mocha    "터미널 256bit로는 적용안됨
colorscheme	tokyonight	
"colorscheme  dracula
"colorscheme nightfox
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 234
"colorscheme seoul256
