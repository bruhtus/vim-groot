" File: autoload/groot.vim
" Maintainer: Robertus Diawan Chris <https://github.com/bruhtus>
" License:
" Copyright (c) Robertus Diawan Chris. Distributed under the same terms as Vim itself.
" See :h license
"
" Description:
" minimalist vim-rooter alternative for git repo

function! groot#toggle()
  if exists('b:groot_enabled')
    unlet b:groot_enabled
    unlet b:groot_first_time
    execute 'lcd %:p:h'
    echo 'Root directory disabled'

  else
    let l:root = systemlist('git rev-parse --show-toplevel')[0]

    if v:shell_error
      echo 'Not in git repo directory'
    else
      let b:groot_enabled = 1
      execute 'lcd ' . l:root
      if !exists('b:groot_first_time')
        let b:groot_first_time = 1
        echo 'Changed directory to: ' . l:root
      endif
    endif

  endif
endfunction

function! groot#temp()
  let l:root = systemlist('git rev-parse --show-toplevel')[0]

  if v:shell_error
    echo 'Not in git repo directory'
  else
    execute 'lcd ' . l:root
  endif
endfunction
