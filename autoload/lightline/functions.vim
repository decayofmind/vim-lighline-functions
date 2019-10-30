scriptencoding utf-8

function! s:is_terminal() abort
  return &buftype ==# 'terminal'
endfunction

" https://github.com/josa42/vim-lightline-sensible/blob/master/autoload/lightline/sensible.vim
function! s:is_hidden()
  let buftypes = ['terminal']
  let filetypes = ['nerdtree', 'startify', 'list', 'help', 'fugitive', 'fugitiveblame', 'qf', 'git', 'vim-plug']
  let filenames = ['[Plugins]', '__vista__', 'startify', 'NERDTree', 'Tagbar', 'Gundo']
  return  s:is_terminal() || index(filetypes, &filetype) != -1 || index(filenames, expand('%:t')) != -1
endfunction

" https://github.com/josa42/vim-lightline-sensible/blob/master/autoload/lightline/sensible.vim
function! lightline#functions#fileencoding()
  return s:is_hidden() ? '': (&fenc !=# '' ? &fenc : &enc)
endfunction

function! lightline#functions#fileformat_devicons()
  return s:is_hidden() ? '' : winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! lightline#functions#filename() abort
  if s:is_terminal()
    let cmd = substitute(expand('%'), '^!', '', '')
    return fnamemodify(cmd, ':t')
  endif
  if s:is_hidden()
    return ''
  endif
  let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
  let modified = &modified ? ' +' : ''
  return fnamemodify(filename, ":~:.") . modified
endfunction

function! lightline#functions#filetype_devicons()
  if s:is_hidden()
    return ''
  endif
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! lightline#functions#gitblame_coc() abort
  let blame = get(b:, 'coc_git_blame', '')
  let blame_length = winwidth(0) - 65
  if strlen(blame) < winwidth(0) - 65
    return winwidth(0) > 90 ? blame : ''
  endif
  return winwidth(0) > 90 ? blame[:blame_length] . '...' : ''
endfunction

function! lightline#functions#gitinfo_coc() abort
    if s:is_hidden()
      return ''
    endif
    let gitbranch=get(g:, 'coc_git_status', '')
    let gitcount=get(b:, 'coc_git_status', '')
    let gitinfo = []
    if empty(gitbranch)
        let gitbranch=""
    endif
    if empty(gitcount)
        let gitcount=""
    endif
    call add(gitinfo,gitbranch)
    call add(gitinfo,gitcount)
    return trim(join(gitinfo,''))
endfunction

function! lightline#functions#lineinfo() abort
    return &filetype ==? 'help'             ? ''  :
    \      &filetype ==? 'nerdtree'         ? ' ' :
    \      &filetype ==? 'vim-plug'         ? ' ' :
    \      &filetype ==? 'vista_kind'       ? ' ' :
    \      &filetype ==? 'vista'            ? ' ' :
    \      &buftype  ==? 'terminal'         ? ' ' :
    \      printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
endfunction

function! lightline#functions#method_vista() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" https://github.com/josa42/vim-lightline-sensible/blob/master/autoload/lightline/sensible.vim
function! lightline#functions#mode()
  if s:is_terminal()
    return lightline#mode()
  endif
  return s:is_hidden() ? '': lightline#mode()
endfunction

function! lightline#functions#readonly()
  if s:is_hidden()
    return ''
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! lightline#functions#reload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
