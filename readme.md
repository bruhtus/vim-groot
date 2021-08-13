# groot.vim

Groot is a plugin to change current working directory to git root directory. To make it simple, git root directory is a directory that has `.git` directory or file (for git bare repo).

Groot use shell command `git rev-parse --show-toplevel` to determine the git root directory, so make sure you can run those command in your current working directory.

## Installation

Install this plugin using your favorite plugin manager, below is a few example of plugin manager that available:
- [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'bruhtus/vim-groot'
```
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
```vim
use 'bruhtus/vim-groot'
```
- [minpac](https://github.com/k-takata/minpac)
```vim
call minpac#add('bruhtus/vim-groot')
```

## Usage

Groot is not compatible with `autochdir` option, so if you `set autochdir` then Groot will turn that off (`set noautochdir`). Please keep that in mind.

Groot provide a similar way to change your current working directory to the file directory. It is not turn on by default, you can turn it on by putting the line below to your vimrc or something similar:
```vim
let g:groot_autochdir = 1
```

Groot only provide a toggle and doesn't change automatically to git root directory. It was by design, because automatically changing to git root directory can give trouble in large projects so you should turn it on yourself. Groot also doesn't provide any keybinding, you can make your own keybinding with the `<Plug>(GrootToggle)` mapping.

For example: <br>
```vim
nmap <leader>n <Plug>(GrootToggle)
```

## FAQ

- Why another change directory plugin?

> This plugin is a way for me to learn about `autocmd` event in vim, and also I want something simpler than `vim-rooter`.

- Is this plugin support changing current working directory to other root directory?

> No, this plugin use `git rev-parse --show-toplevel` command. So, this plugin only change current working directory to git root directory. If you want to change to other root directory, you can check [vim-rooter](https://github.com/airblade/vim-rooter) instead.

## Credits

- [vim-rooter](https://github.com/airblade/vim-rooter).
- [junegunn's vimrc](https://github.com/junegunn/dotfiles/blob/057ee47465e43aafbd20f4c8155487ef147e29ea/vimrc#L656-L667).
