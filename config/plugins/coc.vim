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

inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

inoremap <silent><expr> <c-o> coc#refresh()

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
xmap <Space>f  <Plug>(coc-format-selected)
nmap <Space>f  <Plug>(coc-format-selected)

xmap <Space>a  <Plug>(coc-codeaction-selected)
nmap <Space>aw  <Plug>(coc-codeaction-selected)w

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-]>"
"nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-[>"
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
nmap <silent> <F3> :CocCommand explorer<CR>

" === coc-yank
nmap <silent> <Space>yy :<C-u>CocList -A --normal yank<CR>
nmap <Space>yc :CocCommand yank.clean<CR>

