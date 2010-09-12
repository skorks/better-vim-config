"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The filetype and pathogen configs must be at the top of the file, to make sure plugins load correctly
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off "force the filetype detection to be off so that no confusion for pathogen.vim config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen.vim configuration so all plugins can have a separate directory of their own
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

" Enable filetype plugin
set nocompatible
syntax on "syntax highlighting
filetype on
filetype plugin on
filetype indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd Filetype java set omnifunc=javacomplete#Complete 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General config options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=5000 "sets how many lines of history VIM has to remember
set autoread "set to auto read when a file is changed from the outside
set number "line numbers

" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" fast saving (for some reason can't put this comment on the same live as the
" command, causes trouble)
nmap <leader>w :w!<cr> 

" Fast editing of the .vimrc
if MySys() == "windows"
  map <leader>e :e! ~\_vimruntime\vimrc<cr>
  autocmd! bufwritepost vimrc source ~\_vimruntime\vimrc "when vimrc is edited, reload it
elseif MySys() == "linux"
  map <leader>e :e! ~/.vimruntime/vimrc<cr>
  autocmd! bufwritepost vimrc source ~/.vimruntime/vimrc "when vimrc is edited, reload it
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up color scheme, fonts, encoding and file formats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"peaksea color scheme configuration
if has("gui_running")
  "set guioptions-=T "no toolbar
  "set background=dark
  "set t_Co=256
  "colorscheme peaksea
else
  "set background=dark
  "set t_Co=256
  "colorscheme peaksea
  "set background=dark
  "colorscheme zellner
endif

" Set font according to system
if MySys() == "mac"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h13
  set shell=/bin/bash
elseif MySys() == "windows"
  set gfn=Consolas:h11
elseif MySys() == "linux"
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

"encoding and file formats
set encoding=utf8
try
    lang en_US
catch
endtry

if MySys() == "windows"
  set ffs=dos,unix,mac "Default file types
elseif MySys() == "linux"
  set ffs=unix,dos,mac "Default file types
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI and other useful stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7 " Set 7 lines to the curors - when moving vertical..
set wildmenu "Turn on WiLd menu (can set wildmode as well to customize completion)
set ruler "Always show current position
set cmdheight=2 "The commandbar height
set ignorecase "Ignore case when searching
set smartcase " make search case sensitive if there are capital letters
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set showmatch "Show matching bracets when text indicator is over them
set mat=9 "How many tenths of a second to blink
set hid "Change buffer - without saving, ie able to hide buffers even when there are changes in them
set magic "Set magic on, for regular expressions
set timeoutlen=500 "Quick timeouts on key combinations.
set title " Set xterm title
set backspace=eol,start,indent " Set backspace config
set whichwrap+=<,>,h,l " add keys that will allow to wrap to next line
set shortmess=atI " less verbose message less prompts to press enter
set showcmd " see what you're actually doing with the keyboard
set sidescroll=1
set sidescrolloff=3
set printoptions=paper:letter

" No sound on errors
set noerrorbells
set novisualbell
set vb t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-backup files and .swp files don't go to pwd
if MySys() == "windows"
  set backupdir=~\_vimtmp,C:\temp,D:\tmp
  set directory=~\_vimtmp,C:\temp,D:\tmp
elseif MySys() == "linux"
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, indent (can depend on type of file)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"2 spaces intead of tabs
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
":set softtabstop=4 shiftwidth=4 expandtab - for python code for example

set linebreak
set textwidth=1000

"automatically indent
set smartindent
set cindent
set autoindent "Auto indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype indents etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c,cpp,javascript,xml,xhtml,html set shiftwidth=2 softtabstop=2
autocmd FileType java,python set shiftwidth=4 softtabstop=4

""""""""""""""""""""""""""""""
" Convenience options
""""""""""""""""""""""""""""""
map 0 ^
map - $
map ' `

" Map space to / (search) and c-space to ? (backgwards search)
map <silent> <leader><cr> :noh<cr>

" Scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" disable indenting when pasting from other programs
nnoremap <F6> :set invpaste paste?<CR>
set pastetoggle=<F6>
set showmode

" causes the dictionary words to always be included in the possible completions
if MySys() == "linux"
  :set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
  :set complete-=k complete+=k
endif

map <leader>mb 20<C-W>>
map <leader>ms 20<C-W><

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/', "~/", "g")
    return curdir
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

""""""""""""""""""""""""""""""
" Visual mode
""""""""""""""""""""""""""""""
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git'
if MySys() == "linux"
  set grepprg=/bin/grep\ -nH
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""
" Minibufferexplorer 
""""""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

let g:bufExplorerSortBy = "name" 
autocmd BufRead,BufNew :call UMiniBufExplorer
map <leader>u :TMiniBufExplorer<cr>:TMiniBufExplorer<cr>

""""""""""""""""""""""""""""""
" bufExplorer 
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1

""""""""""""""""""""""""""""""
" Fuzzy finder
""""""""""""""""""""""""""""""
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD **/<CR>
catch
endtry

""""""""""""""""""""""""""""""
" Session manager 
""""""""""""""""""""""""""""""
map <leader>sl :SessionList<CR>
map <F3> :SessionOpenLast<CR>
map <leader>sc :SessionClose<CR>
map <F4> :SessionSave<CR>
map <leader>ssa :SessionSaveAs<CR>

set viminfo='1000,f1,<500,!

""""""""""""""""""""""""""""""
" Taglist 
""""""""""""""""""""""""""""""
map <F5> :TlistToggle<cr>
let Tlist_WinWidth = 50
let Tlist_Process_File_Always = 1

""""""""""""""""""""""""""""""
" OmniCompletion for snipmate 
""""""""""""""""""""""""""""""
let g:acp_behaviorSnipmateLength = 1

""""""""""""""""""""""""""""""
" ctags stuff 
""""""""""""""""""""""""""""""
if MySys() == "linux"
  map <F8> :!/usr/bin/ctags -R .<CR>
endif
