" Align.vim -- a Vim plugin to automatically format of parenthesis/braces
" content during C/C++/C#/Java file editing
" Copyright (c) 2006, Michael Schwarz <shvarts@akmosoft.com>
" Distributed under the GNU General Public License.
"
" Version: 0.1
"
" Last Change: 2006 Thu Mar 16
function! Ins(char)
  exec "normal a".a:char
endf

function! IsOperator(str)
  return match(a:str, '^\([+/*%&|^!=><-]=\|\([|&^+-><]\)\2\|->\|()\|\[\]\)') != -1
endf

function! GetCurIDName()
  return synIDattr(synID(line("."), col("."), 1), "name")
endf

function! InsSpace()
  normal l
  let id = GetCurIDName()
  normal h
  if GetCurIDName() == '' || id == ''
    normal hy4ll
    "echo '@":'.@"
    if !IsOperator(strpart(@",1)) && match(@", '^.\(.\s\|\s.\|.[;,]\|[a-zA-Z_0-9:.!]\{2\}\|.++\|.--\|.->\|->.\)\|->..') == -1
      call Ins(' ')
      return 1
    endif
  endif
  return 0
endf

function! SurroundWithSpaces()
  let i = 0
  normal h
  let i = i+InsSpace()
  normal l
  let i = i+InsSpace()
  return i
endf
function! Align(char)
  call setline('.',strpart(getline('.'),0,col('.')).a:char.strpart(getline('.'), col('.')))
  normal l
  if GetCurIDName() != ''
    return
  endif
  let iLastLine=line('.')
  let iLastPos=col('.')
  " echo 'iLastLine:'.iLastLine.', iLastPos:'.iLastPos
  normal %
  let iCurLine=line('.')
  let iCurPos=col('.')
  "echo 'iCurLine:'.iCurLine.', iCurPos:'.iCurPos
  if iCurLine == iLastLine && iCurPos == iLastPos
    return
  endif
  call SurroundWithSpaces()
  while iCurLine <= iLastLine " || iCurPos <= iLastPos + 1
    call search('[%^&*()+=|/<>!;,\[\]-]')
    normal yl
    let char = @"
    if GetCurIDName() == ''
      if char == '(' || char == '['
        let iPos=col('.')
        normal %
        let iLastPos = iLastPos + col('.') - iPos
      else
        if char == a:char
          let iLastPos = iLastPos + SurroundWithSpaces()
          normal l
          return
        endif
        let iLastPos = iLastPos + SurroundWithSpaces()
      endif
    endif

    let iCurLine=line('.')
    let iCurPos=col('.')
    "       echo 'iCurLine:'.iCurLine.', iCurPos:'.iCurPos
  endwhile
endf
imap ) <Esc>:call Align(')')<CR>a
imap ] <Esc>:call Align(']')<CR>a
