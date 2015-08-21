""""""""""""""""""""""""""""""
" load pathogen for plugins (plugins stored in ~/.vim/plugins)
""""""""""""""""""""""""""""""
runtime plugins/vim-pathogen/autoload/pathogen.vim

call pathogen#infect('plugins/{}')
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no vi compatibility mode which is more useful, this should be on automatically as soon as this
" file is loaded, but better safe than sorry
set nocompatible

" localleader is another type of leader key, make them the same for simplicity
let mapleader = ","
let maplocalleader = ","

" how many commands VIM will remember for us, stored in the .viminfo file
set history=5000

" load plugins for specific file types when the file types are detected
filetype plugin on

" load indent files for specific file types when the file types are detected
filetype indent on

" for graphical vims reload file if it's changed outside of vim, won't do anything for terminal vims
set autoread

" save a keystroke when saving
nmap <leader>w :w!<cr>

" :W to sudo save the file
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ensure UI language is correct
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 7 lines to the curors - when moving vertical..
set scrolloff=7

" switch on line numbers
set number

" turn on WiLd menu
set wildmenu

" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" ignore compiled files and source control stuff
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" always show current position, bottom right
set ruler

" try to avoid 'hit enter' prompts
set shortmess=a

" the commandbar height, also helps to avoid hit enter prompts
set cmdheight=2

" change buffer - without saving, ie able to hide buffers even when there are changes in them
set hid

" configure backspace to act like you would expect
set backspace=eol,start,indent

" move to the previous/next line using cursor keys, i.e. naturally expected behaviour
set whichwrap+=<,>,h,l,[,]

" if the mouse works, enable it
if has('mouse')
  set mouse=a
endif

" ignore case when searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch

" don't redraw while executing macros (good performance config)
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=2

" no sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" quick timeouts on key combinations
set timeoutlen=1000
set ttimeoutlen=10

" set xterm title
set title

" see what you're actually doing with the keyboard
set showcmd

" help visualize folds a bit better
set foldcolumn=1

" minimal number of columns to scroll horizontally
set sidescroll=1

" minimal number of screen columns to keep to the left/right of the cursor if 'nowrap' is set
set sidescrolloff=3

" lines to scroll when cursor leaves screen
set scrolljump=5

" better unix windows compatibility
set viewoptions=cursor,folds,slash,unix

" allow for cursor beyond last character
set virtualedit=onemore

" display the current mode
set showmode

" show tabs and trailing spaces
set list

" chars used to highlight problematic whitespace
set listchars=tab:,.,trail:.,extends:#,nbsp:.

" by default update time is a bit too long 4000
set updatetime=750


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up color scheme, fonts, encoding and file formats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable

set encoding=utf8

" use Unix as the standard file type
set ffs=unix,dos,mac

try
    colorscheme desert
catch
endtry

set background=dark

" extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T  "no toolbar
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't need backup files all over the place
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use spaces instead of tabs
set expandtab

" be smart when using tabs
set smarttab

" 2 spaces intead of tab
set tabstop=2
set shiftwidth=2

" wrap lines visually
set wrap

" only wrap at a character in the breakat option
set linebreak

set textwidth=0

" show us when we get past column 80
set colorcolumn=80,120

" automatically indent
set smartindent
set cindent
set autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetype indents
autocmd FileType c,cpp,javascript,xml,xhtml,html set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType java,python set shiftwidth=4 softtabstop=4 expandtab

autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows, buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :nohl<cr>

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

" close the current buffer
map <leader>bd :Bclose<cr>

" close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>bs :b

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always show the status line
set laststatus=2

" format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\
" filetype
set statusline+=\[%{&ff}/%Y]
set statusline+=\ CWD:\ %r%{getcwd()}%h
" right aligned file nav info
set statusline+=%=%-14.(Line:\ %l,\ Col:\ %c%V%)\ %p%%

" git stuff, once we have the plugin
"set statusline+=%{fugitive#statusline()}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^
map - $

" not sure if we need this
"map ' `

" move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite * :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag searching and cope displaying
" requires ag.vim
" NOTE this all needs to be reworked, a bit wonky right now
" needs highlighting for matches, need to use buffers instead of tabs, but tabs should be optional
" need a good way to do search replace across many files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>r - global search and replace, selected text in current file, with confirmation
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" when you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" open Ag and put the cursor in the right position
map <leader>g :Ag

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" format json
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
if has("gui_running")
    set background=dark
    colorscheme peaksea
else
    colorscheme desert
    let g:colors_name="desert"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn persistent undo on means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    let current_undo_dir=$HOME.'/.vim/undodir'

    if !isdirectory(current_undo_dir)
        silent! call mkdir(current_undo_dir)
    endif

    " same as 'set undodir=', but using variable as value
    let &undodir=current_undo_dir
    set undofile
catch
  echo "Unable to turn on persistent undo, maybe failed to create directory"
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" <CR>" )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/' . '/gc<left><left><left>')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" don't close window, when deleting a buffer
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

" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/scrooloose/nerdtree.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nbc :Bookmark<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg$', '\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/bling/vim-airline.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = 'b%s '
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/jeetsukumaran/vim-buffergator.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>bg :BuffergatorToggle<CR>
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_display_regime = "bufname"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/kien/ctrlp.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = '~/.vim/cache/ctrlp'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.DS_Store$\|node_modules$\|bower_components$\|tmp$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/easymotion/vim-easymotion.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable default mappings
let g:EasyMotion_do_mapping = 0

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/scrooloose/syntastic.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["sass", "scss"] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/airblade/vim-gitgutter.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_column_always = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/elzr/vim-json.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/othree/javascript-libraries-syntax.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'jquery,underscore,backbone'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-easy-align.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-scripts/YankRing.vim.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>yr :YRShow<CR>
let g:yankring_history_dir = '~/.vim'
let g:yankring_replace_n_pkey = '<C-o>'
let g:yankring_replace_n_nkey = '<C-i>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/mbbill/undotree.git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :UndotreeToggle<cr>
