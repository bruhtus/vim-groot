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

if exists('g:groot_autochdir')
	function! s:groot_buffer()
		if !exists('b:groot_enabled')
			" change directory to file directory automatically
			" almost the same as `set autochdir` but more flexible
			silent! lcd %:p:h
		else
			unlet b:groot_enabled
			silent! lcd %:p:h
			call groot#toggle()
		endif
	endfunction

	augroup GrootBuffer
		autocmd!
		autocmd BufEnter * call s:groot_buffer()
	augroup END
endif

command! Groot call groot#toggle()
