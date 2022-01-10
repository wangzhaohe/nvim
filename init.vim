set number
set relativenumber
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set ignorecase
set smartcase
set noshowmode
"set noshowcmd
set showcmd
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set clipboard+=unnamedplus
set shortmess+=c
"set signcolumn=number
set signcolumn=yes
set hidden
set termguicolors
set updatetime=100
set foldmethod=indent

set cursorline
"set cursorcolumn
set mouse=a
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
set undofile
set undodir=$HOME/.config/nvim/tmp/undo,.

nnoremap <silent> q :close<CR>
nnoremap W :w<CR>
nmap R :source $MYVIMRC<CR>

noremap ; :
"noremap H ^
"noremap L $
noremap ` ~
"noremap J 5j
"noremap K 5k
noremap > >>
noremap < <<
nnoremap vv ^v$h
nmap <silent> <Space><CR> :nohlsearch<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>

" Windows
nmap <silent> sH :set nosplitright<CR>:vsplit<CR>
nmap <silent> sJ :set splitbelow<CR>:split<CR>
nmap <silent> sK :set nosplitbelow<CR>:split<CR>
nmap <silent> sL :set splitright<CR>:vsplit<CR>
nmap <silent> <Space>1 :1wincmd w<CR>
nmap <silent> <Space>2 :2wincmd w<CR>
nmap <silent> <Space>3 :3wincmd w<CR>
nmap <silent> <Space>4 :4wincmd w<CR>
nmap <silent> <Space>5 :5wincmd w<CR>
nmap <silent> <Space>6 :6wincmd w<CR>
nmap <silent> <Space>7 :7wincmd w<CR>
nmap <silent> <Space>8 :8wincmd w<CR>
nmap <silent> <Space>9 :9wincmd w<CR>
nmap sh <C-w>h
nmap sj <C-w>j
nmap sk <C-w>k
nmap sl <C-w>l
nmap <silent> s- :res -5<CR>
nmap <silent> s= :res +5<CR>
nmap <silent> s[ :vertical res -5<CR>
nmap <silent> s] :vertical res +5<CR>
nmap sb <C-w>t<C-w>K
nmap sv <C-w>t<C-w>H
noremap srb <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
noremap <silent> sth :set nosplitright<CR>:vsplit<CR>:term<CR>i
noremap <silent> stj :set splitbelow<CR>:split<CR>:term<CR>i
noremap <silent> stk :set nosplitbelow<CR>:split<CR>:term<CR>i
noremap <silent> stl :set splitright<CR>:vsplit<CR>:term<CR>i
noremap <silent> stt :tabe<CR>:term<CR>i

" Tabs
nmap <silent> tn :tabe<CR>
nmap <silent> tb :tabNext<CR>
nmap <silent> t1 <Plug>AirlineSelectTab1
nmap <silent> t2 <Plug>AirlineSelectTab2
nmap <silent> t3 <Plug>AirlineSelectTab3
nmap <silent> t4 <Plug>AirlineSelectTab4
nmap <silent> t5 <Plug>AirlineSelectTab5
nmap <silent> t6 <Plug>AirlineSelectTab6
nmap <silent> t7 <Plug>AirlineSelectTab7
nmap <silent> t8 <Plug>AirlineSelectTab8
nmap <silent> t9 <Plug>AirlineSelectTab9
nmap <silent> t0 <Plug>AirlineSelectTab0
nmap <silent> th <Plug>AirlineSelectPrevTab
nmap <silent> tl <Plug>AirlineSelectNextTab

noremap <Space>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitright
		exec "!gcc % -o %<"
		:vsp
		:term ./%<
	elseif &filetype == 'cpp'
		set splitright
		exec "!g++ -std=c++11 % -Wall -o %<"
		:vsp
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
    set splitbelow
    :sp
    :term dart %
    "silent! exec "CocCommand flutter.run"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'theniceboy/nvim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
call plug#end()

" ===
" === gruvbox
" ===
"color gruvbox

" ===
" === nvim-deus
" ===
color deus

source ~/.config/nvim/config/plugins/vim-airline.vim
source ~/.config/nvim/config/plugins/undotree.vim
source ~/.config/nvim/config/plugins/rainbow.vim
source ~/.config/nvim/config/plugins/nerdcommenter.vim
source ~/.config/nvim/config/plugins/coc.vim
source ~/.config/nvim/config/md-snippets.vim
source ~/.config/nvim/config/plugins/indentLine.vim

" indentLine
map <F3> :IndentLinesToggle<cr>
"colorscheme desert
