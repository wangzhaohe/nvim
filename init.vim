set number
set relativenumber
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set ignorecase
set smartcase
set noshowmode
set noshowcmd
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set clipboard+=unnamedplus
set updatetime=100
set shortmess+=c
set signcolumn=number
set hidden
set termguicolors
set updatetime=100

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
set undofile
set undodir=$HOME/.config/nvim/tmp/undo,.

nnoremap <silent> q :q<CR>
nnoremap W :w<CR>
nmap R :source $MYVIMRC<CR>

noremap ; :
noremap H ^
noremap L $
noremap ` ~
noremap J 5j
noremap K 5k
noremap > >>
noremap < <<
nnoremap vv ^v$h
nmap <silent> <Space><CR> :nohlsearch<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

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
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
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
call plug#end()
