"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" The filetype and pathogen configs must be at the top of the file, to make sure plugins load correctly
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
filetype off "force the filetype detection to be off so that no confusion for pathogen.vim config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" pathogen.vim configuration so all plugins can have a separate directory of their own
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
call pathogen#infect("plugins") 
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Enable filetype plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set nocompatible

syntax on "syntax highlighting
filetype on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" General config options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" With a map leader it's possible to do extra key combinations, i.e. it is another control character like Shift or Ctrl
let mapleader = ","
let maplocalleader = ","

" Fast editing of the .vimrc and cheetsheet
if MySys() == "windows"
  map <leader>e :e! ~\_vimruntime\vimrc<cr>
  autocmd! bufwritepost vimrc source ~\_vimruntime\vimrc "when vimrc is edited, reload it
elseif MySys() == "linux" || MySys() == "mac"
  map <leader>e :e! ~/.vimruntime/vimrc<cr>
  autocmd! bufwritepost vimrc source ~/.vimruntime/vimrc "when vimrc is edited, reload it
  map <leader>c :e! ~/.vimruntime/cheatsheet.md<cr>
endif

" location of the ctags command to stop ctags errors
if MySys() == "mac"
  let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
endif

set history=5000 "sets how many lines of history VIM has to remember
set autoread "set to auto read when a file is changed from the outside
set number "line numbers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Set up color scheme, fonts, encoding and file formats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
if has("gui_running")
  set guioptions-=T "no toolbar
  set background=dark
  set gfn=Monaco:h15
  colorscheme solarized
else
  set background=light
  set t_Co=256
endif

" Set font according to system
if MySys() == "mac"
  set gfn=Monaco:h13
  if has("gui_running")
    set gfn=Monaco:h15
  endif
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
elseif MySys() == "mac"
  set ffs=unix,dos,mac "Default file types
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" VIM UI and other useful stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set scrolloff=7                   "Set 7 lines to the curors - when moving vertical..
set wildmenu                      "Turn on WiLd menu (can set wildmode as well to customize completion)
set wildmode=list:longest,full    "command <Tab> completion, list matches, then longest common part, then all.
set cmdheight=2                   "The commandbar height
set ignorecase                    "Ignore case when searching
set smartcase                     "make search case sensitive if there are capital letters
set hlsearch                      "Highlight search things
set incsearch                     "Make search act like search in modern browsers
set showmatch                     "Show matching bracets when text indicator is over them
set mat=9                         "How many tenths of a second to blink
set hid                           "Change buffer - without saving, ie able to hide buffers even when there are changes in them
set magic                         "Set magic on, for regular expressions
set timeoutlen=500                "Quick timeouts on key combinations.
set title                         "Set xterm title
set backspace=eol,start,indent    "Set backspace config
set whichwrap+=<,>,h,l            "add keys that will allow to wrap to next line
set shortmess+=filmnrxoOtT        "less verbose message less prompts to press enter
set showcmd                       "see what you're actually doing with the keyboard
set sidescroll=1
set sidescrolloff=3               " minimum lines to keep above and below cursor
set scrolljump=5                  " lines to scroll when cursor leaves screen
set printoptions=paper:letter
set shortmess+=A

set mouse=a                                        "automatically enable mouse usage
set viewoptions=folds,options,cursor,unix,slash    "better unix / windows compatibility
set virtualedit=onemore                            "allow for cursor beyond last character
set showmode                                       "display the current mode
set linespace=0                                    "No extra spaces between rows
set list                                           "show tabs and trailing spaces
set listchars=tab:,.,trail:.,extends:#,nbsp:.      "chars used to highlight problematic whitespace
set ruler                                          "Always show current position
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "a ruler on steroids

" No sound on errors
set noerrorbells
set novisualbell
set vb t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set backup                      "switch on backups

if has('persistent_undo')
  set undofile                  "switch on persistent undo (vim 7.3+)
  set undolevels=1000           "maximum number of changes that can be undone
  set undoreload=10000          "maximum number lines to save for undo on a buffer reload
endif

" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview     "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview   "make vim load view (state) (folds, cursor, etc)

" Auto-backup files and .swp files don't go to pwd
if MySys() == "windows"
  set backupdir=~\_vimtmp,$TEMP
  set directory=~\_vimtmp,$TEMP
  set undodir=~\_vimtmp,$TEMP
elseif MySys() == "linux"
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
elseif MySys() == "mac"
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Text, tab, indent (can depend on type of file)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" 2 spaces intead of tabs
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab

set linebreak
set textwidth=5000

"automatically indent
set smartindent
set cindent
set autoindent     "Auto indent
set wrap           "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" filetype indents etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
autocmd FileType c,cpp,javascript,xml,xhtml,html set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType java,python set shiftwidth=4 softtabstop=4 expandtab

autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Convenience options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
map 0 ^
map - $
map ' `

" no highlighting 
map <silent> <leader><cr> :noh<cr>

" Scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

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

" make a window bigger of smaller
map <leader>mvb :vertical resize +10<CR>
map <leader>mvs :vertical resize -10<CR>
map <leader>mhb :resize +10<CR>
map <leader>mhs :resize -10<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Format the statusline
" set statusline=\ %F%m%r%h%{fugitive#statusline()}\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"function! CurDir()
"    let curdir = substitute(getcwd(), '/', "~/", "g")
"    return curdir
"endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Visual mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"to always show a nice tabline in console vim
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= i . ')'
      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

" set up tab tooltips with every buffer name
function! GuiTabToolTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    " separate buffer entries
    if tip!=''
      let tip .= " \n "
    endif
    " Add name of buffer
    let name=bufname(bufnr)
    if name == ''
      " give a name to no name documents
      if getbufvar(bufnr,'&buftype')=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    endif
    let tip.=name
    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor
  return tip
endfunction
set guitabtooltip=%{GuiTabToolTip()}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
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

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum
      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => PLUGIN CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/scrooloose/nerdtree.git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
map <F2> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/kien/ctrlp.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 2
let g:ctrlp_map = '<Leader>t'
nnoremap <silent> <Leader>t :CtrlP<CR>
nnoremap <silent> <Leader>tmru :CtrlPMRU<CR>
nnoremap <silent> <Leader>tmix :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/Shougo/neocomplcache.git & completion in general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_delimiter = 1

let g:neocomplcache_max_list = 20

let g:neocomplcache_disable_auto_complete = 0 " should the autocompletion popup come up automatically 0 means yes

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0

if MySys() == "linux"
  let g:neocomplcache_ctags_program = "/usr/bin/ctags"
elseif MySys() == "mac"
  let g:neocomplcache_ctags_program = "/usr/local/Cellar/ctags/5.8/bin/ctags"
endif

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin key-mappings.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"             "TAB completion.
inoremap <expr>"\<CR>" pumvisible() ? neocomplcache#smart_close_popup()."\<CR>" : "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/majutsushi/tagbar.git & ctags in general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if MySys() == "linux"
  map <Leader>tags :!/usr/bin/ctags .<CR>
elseif MySys() == "mac"
  map <Leader>tags :!/usr/local/Cellar/ctags/5.8/bin/ctags .<CR>
endif

" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" Open tag under cursor in a new tab
nmap <C-\> <C-w><C-]><C-w>T

nnoremap <silent> <leader>tt :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/msanders/snipmate.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_behaviorSnipmateLength = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/markabe/bufexplorer.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
nmap <leader>b :BufExplorer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/scrooloose/syntastic.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/leshill/vim-json.git & json in general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/gaving/vim-easygrep.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => https://github.com/sjl/splice.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
