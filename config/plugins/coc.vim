" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-tsserver',
	\ 'coc-clangd',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-json',
	\ 'coc-python',
	\ 'coc-pyright',
  \ 'coc-snippets',
	\ 'coc-vimlsp',
  \ 'coc-yaml',
	\ 'coc-yank']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <Space>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <Space>rn <Plug>(coc-rename)

xmap <Space>a  <Plug>(coc-codeaction-selected)
nmap <Space>aw  <Plug>(coc-codeaction-selected)w

nnoremap <silent><nowait><expr> <C-]> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-]>"
nnoremap <silent><nowait><expr> <C-[> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-[>"

" coc-snippets
map <C-h> <nop>
map <C-l> <nop>
let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
let g:snips_author = 'Swotpp'

" === coc-flutter-tools
nmap <silent> <Space>ol :CocCommand flutter.toggleOutline<CR>

" === coc-explorer
nmap <silent> <Space>t :CocCommand explorer<CR>

" === coc-yank
nmap <silent> <Space>yy :<C-u>CocList -A --normal yank<CR>
nmap <Space>yc :CocCommand yank.clean<CR>

