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
      \   'filetype': 'lightline#functions#filetype_devicons',
      \   'fileformat': 'lightline#functionsfileformat_devicons',
      \   'filename': 'lightline#functions#filename',
      \   'cocstatus': 'coc#status',
      \   'method': 'lightline#functions#method_vista',
      \   'lineinfo': 'lightline#functions#lineinfo',
      \   'readonly': 'lightline#functions#readonly',
      \   'gitinfo': 'lightline#functions#gitinfo_coc',
      \   'gitblame': 'lightline#functions#gitblame_coc',
    \ }
```

## Credits

Projects/files which inspired me

* https://github.com/josa42/vim-lightline-sensible
