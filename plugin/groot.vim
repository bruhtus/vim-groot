" File: plugin/groot.vim
" Maintainer: Robertus Diawan Chris <https://github.com/bruhtus>
" License:
" Copyright (c) Robertus Diawan Chris. Distributed under the same terms as Vim itself.
" See :h license
"
" Description:
" minimalist vim-rooter alternative for git repo

if exists('g:loaded_groot')
  finish
endif

let g:loaded_groot = 1

" doesn't support autochdir option
if &autochdir
  set noautochdir
endif

if get(g:, 'groot_autochdir') == 1
  augroup GrootBuffer
    autocmd!
    autocmd BufEnter *
          \ if !exists('b:root_enabled') |
          \   silent! lcd %:p:h          |
          \ else                         |
          \   unlet b:root_enabled       |
          \   silent! lcd %:p:h          |
          \   call root#toggle()         |
          \ endif
  augroup END
endif

nnoremap <silent> <Plug>(GrootToggle) :<C-u>call groot#toggle()<CR>
command! GrootTemp call groot#temp()
