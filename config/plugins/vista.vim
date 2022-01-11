" ===
" === vista.vim
" ===
noremap <silent> <F2> :Vista!!<CR>
noremap <Space>t :silent! Vista finder coc<CR>
let g:vista_default_executive = 'coc'
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
