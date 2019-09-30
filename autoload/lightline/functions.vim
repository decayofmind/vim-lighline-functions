function! lightline#functions#filetype#devicons()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! lightline#functions#fileformat#devicons()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! lightline#functions#gitinfo#coc() abort
    if &filetype ==? 'vista'
        return ""
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

function! lightline#functions#gitblame#coc() abort
  let blame = get(b:, 'coc_git_blame', '')
  let blame_length = winwidth(0) - 65
  if strlen(blame) < winwidth(0) - 65
    return winwidth(0) > 90 ? blame : ''
  endif
  return winwidth(0) > 90 ? blame[:blame_length] . '...' : ''
endfunction

function! lightline#functions#method#vista() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! lightline#functions#filename() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~ 'NERD_tree'
        return ''
    endif
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ":~:.") . modified
endfunction

function! lightline#functions#lineinfo() abort
    return &filetype ==? 'help'             ? ''  :
    \      &filetype ==? 'defx'             ? ' ' :
    \      &filetype ==? 'vista_kind'       ? ' ' :
    \      &filetype ==? 'vista'            ? ' ' :
    \      printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
endfunction

function! lightline#functions#readonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction
