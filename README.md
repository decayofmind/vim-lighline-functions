# vim-lightline-functions

Custom functions to use with lightline.vim in form of vim plugin.

___I've created this repository mainly to reduce mine NeoVim config.___

## Installation

```
  Plug 'itchyny/lightline.vim'
  Plug "decayofmind/vim-lightline-functions"
```

## Configuration

```viml
  let g:lightline.component_function = {
      \   'cocstatus': 'coc#status',
      \   'fileencoding': 'lightline#functions#fileencoding',
      \   'fileformat': 'lightline#functionsfileformat_devicons',
      \   'filename': 'lightline#functions#filename',
      \   'filetype': 'lightline#functions#filetype_devicons',
      \   'gitinfo': 'lightline#functions#gitinfo_coc',
      \   'gitblame': 'lightline#functions#gitblame_coc',
      \   'lineinfo': 'lightline#functions#lineinfo',
      \   'method': 'lightline#functions#method_vista',
      \   'mode': 'lightline#functions#mode',
      \   'readonly': 'lightline#functions#readonly',
      \ }
```

## Functions

Notice, that if function is dependant on some other plugin (like coc.nvim or vim-devicons),
then it's indicated in it's name.

## Credits

Projects/files which inspired me

* https://github.com/itchyny/lightline-powerful
* https://github.com/josa42/vim-lightline-sensible
