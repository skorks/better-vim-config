" vim: et ts=2 sts=2 sw=2

"if !get(g:, 'cwd_loaded', 0)
  "finish
"endif

let s:spc = g:airline_symbols.space

function! airline#extensions#cwd#init(ext)
  call airline#parts#define_raw('cwd', '%{airline#extensions#cwd#shrinkedcwd()}')
  call a:ext.add_statusline_func('airline#extensions#cwd#apply')
endfunction

function! airline#extensions#cwd#apply(...)
  call airline#extensions#append_to_section('x',
        \ s:spc . g:airline_right_sep . s:spc . '%{airline#extensions#cwd#shrinkedcwd()}')
endfunction

function! airline#extensions#cwd#shrinkedcwd()
  return substitute(getcwd(), '\v\w\zs.{-}\ze(\\|/)', '', 'g')
endfunction

