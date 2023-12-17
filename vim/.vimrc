"#--------------------------------------------------------------
"#--------------------------------------------------------------
"#     pacman으로 vundle을 설치하면 git으로 받은것과 충돌남.
"#     gvim 설치시에 설치될 수도 있으니 꼭 pacman으로 vundle
"#     삭제할것. 삭제하지 않으면 PluginInstall 시에 에러발생함.
"#
"#
"#
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
"Plugin 'thaerkh/vim-indentguides'
Plugin 'markonm/traces.vim' "perldo는 지원안함.highlights patterns and ranges. ex편집기기준이라 BRE만 지원하는듯.
"Plugin 'nordtheme/vim'
"Plugin 'David-Kunz/markid' "같은이름의 구분자들을 같은 색으로 표시
Plugin 'Raimondi/delimitMate'
"Regex 하이라이트 플러그인
Plugin 'Galicarnax/vim-regex-syntax'
Plugin 'ap/vim-css-color'  "color name highlight"
Plugin 'ryanoasis/vim-devicons' "파일타입에 맞춰 아이콘 표시
"Makr 표시기능
Plugin 'kshenoy/vim-signature'
"각종 언어 하이라이트 자동들여쓰기등 지원 
Plugin 'sheerun/vim-polyglot'
"sysntax hightlight 플러그인
"Plugin 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"================================================
" 빠른 insert mode 탈출 플러그인
Plugin 'jdhao/better-escape.vim'
"--------------------------------------------------
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'Exafunction/codeium.vim'
Plugin 'dense-analysis/ale' " ALE : syntax 체크와 구문 에러 지원
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'  "향상된 괄호 표시
"Plugin 'othree/eregex.vim'   "검색명령어 /를 누르면 perl regex로 검색되도록 함.traces와 호환안됨.
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
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
 Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"packadd YouCompleteMe
filetype plugin indent on    " required
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
let g:better_escape_interval = 250

" 24bit color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" delimitMate
let delimitMate_expand_cr=1

"gitgutter용 셋팅: Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
"highlight SignColumn guibg=bg
"highlight SignColumn ctermbg=bg
set updatetime=300
set nobackup
set nowritebackup
set signcolumn=yes

"coc.nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"nmap <silent> <C-p> <Plug>(coc-definition)
"nmap <silent> <C-n> <Plug>(coc-type-definition)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <C-p> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"-----------------------------------------------------
"snippet 설정
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

"---------------------------------------------------------
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)
"---------------------------------------------------------
"coc 설정
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
"---------------------------------------------------------------------------------------
"coc.nvim, utilsnips, copilot.vim을 트리거 키 하나로 통일하기
"그냥 일반 탭을 사용하려면 <C-v><Tab>을 사용한다
" ultisnips
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<Right>"
let g:UltiSnipsJumpBackwardTrigger="<Left>"

" coc.nvim과 codeiumd연동. 
inoremap <silent><script><expr> <Tab> pumvisible() ? "\<C-y>" : codeium#Accept()
" 이렇게 하면 <Tab>키를 누르는 것으로 coc.nvim, ultsnips, codeium을 모두
" 사용가능
"---------------------------------------------------------------------------------------
"let g:indent_guides_enable_on_vim_startup = 0
"탐색기 불러내고 닫기
inoremap <c-b> <ESC>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-b> <ESC>:Lex<cr>:vertical resize 30<cr>

set shortmess+=c

set complete+=kspell   "자동완성기능 추가
set completeopt=menuone,longest

set clipboard=unnamedplus,unnamed
set hlsearch "검색어 하이라이팅
set nu " 줄번호
set number relativenumber
"set autoindent "자동 들여쓰기
set scrolloff=2
"bash 자동완성처럼 명령어 일부만 치면 비슷한 이름 보여주는 기능
set wildmenu
set wildmode=longest:list,full
"set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 "스크롤바 너비
set autowrite "다른 파일로 넘어갈 때 자동 저장
set autoread "작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent "C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 "상태바 표시 항상
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
:highlight Cursorline cterm=bold ctermbg=black
set incsearch
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
"set nowrap
"vim-regex-syntax highlight 셋팅
au FileType python call EnableEmbeddedSyntaxHighlight('pcre', "\\v\\C<R''@!", "\\v([^\\\\]\\\\(\\\\\\\\)*)@<!'", 'Comment')
au FileType cpp call EnableEmbeddedSyntaxHighlight('sql', "\\C\\<R\\\"sql(", ")sql\\\"", 'Comment')
au FileType lua call EnableEmbeddedSyntaxHighlight('pcre', "\\[=\\[", "\\]=\\]", 'Comment')
" Semmi 용 셋팅
"hi semshiLocal           ctermfg=209 guifg=#ff875f
"hi semshiGlobal          ctermfg=214 guifg=#ffaf00
"hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
"hi semshiParameter       ctermfg=75  guifg=#5fafff
"hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
"hi semshiFree            ctermfg=218 guifg=#ffafd7
"hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
"hi semshiAttribute       ctermfg=49  guifg=#00ffaf
"hi semshiSelf            ctermfg=249 guifg=#b2b2b2
"hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
"hi semshiSelected       ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

"hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"sign define semshiError text=E> texthl=semshiErrorSign

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
if has("syntax")
 syntax on
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
"ale용 설정
let g:ale_completion_enabled = 1 " ALE에서 지원하는 자동완성기능
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
"let g:ale_sign_error = '✘'
"let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '--'
let g:ale_sign_warning = '>>'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight link ALEVirtualTextError Error
" 버퍼 목록 켜기
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden

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
let g:tokyonight_style = 'night' " available: night, storm
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
"let g:airline_theme = "tokyonight"
"let g:airline_theme = "catppuccin_mocha"
let g:airline_theme= 'violet'
"let g:airline_solarized_bg='dark'
let g:airline_section_y = '' 
let g:airline_section_warning= '' "마지막 status창 사용 안함
set hidden
"-----------------------------------------------------
let g:rustfmt_autosave = 1
"검색을 정규식으로
map / /\v

"colorscheme catppuccin_mocha
colorscheme	tokyonight	
"colorscheme nordfox
"colorscheme  dracula
"colorscheme terafox
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 234
"colorscheme seoul256
