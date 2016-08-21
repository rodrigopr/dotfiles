set nocompatible        " Must be first line
set shell=/bin/sh

source ~/.vimrc.bundles

" Vim UI
"colorscheme Monokai-chris
"set background=dark          " Assume a dark background
"set background=light         " go back to light
"colorscheme distinguished

" Formatting
set nowrap                        " Do not wrap long lines
set autoindent                    " Indent at the same level of the previous line
set shiftwidth=2                  " Use indents of 4 spaces
set expandtab                     " Tabs are spaces, not tabs
set tabstop=2                     " An indentation every four columns
set softtabstop=2                 " Let backspace delete indent
set nojoinspaces                  " Prevents inserting two spaces after punctuation on a join (J)
set splitright                    " Puts new vsplit windows to the right of the current
set splitbelow                    " Puts new split windows to the bottom of the current
set pastetoggle=<F12>             " pastetoggle (sane indentation on pastes)

" Maximize window
set lines=999
set columns=999

" reduze split screen height
set winheight=10
set winminheight=10
set winheight=9999

" Vertical line at 80 characters
set textwidth=80
set cc=90
highlight ColorColumn ctermbg=8
highlight ColorColumn guibg=gray30

"set tabpagemax=15                 " Only show 15 tabs
set showmode                      " Display the current mode
set cursorline                    " Highlight current line
highlight clear SignColumn        " SignColumn should match background
highlight clear LineNr            " Current line number row will have same background color in relative mode

" Command line info
set ruler                     " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd

" Status line info
set laststatus=2
set statusline=%<%f\                       " Filename
set statusline+=%w%h%m%r                   " Options
set statusline+=\ [%{&ff}/%Y]              " Filetype
set statusline+=\ [%{getcwd()}]            " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%    " Right aligned file nav info

filetype plugin indent on     " Automatically detect file types.
syntax on                     " Syntax highlighting
set mouse+=a                  " Automatically enable mouse usage
set ttymouse=xterm2           " To enable mouse operations inside tmux
set mousehide                 " Hide the mouse cursor while typing
scriptencoding utf-8
set encoding=utf-8
set backspace=indent,eol,start    " Backspace for dummies
set linespace=0                   " No extra spaces between rows
set number                        " Line numbers on
set showmatch                     " Show matching brackets/parenthesis
set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case insensitive search
set smartcase                     " Case sensitive when uc present
set wildmenu                      " Show list instead of just completing
set wildmode=list:longest,full    " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]     " Backspace and cursor keys wrap too
set scrolljump=5                  " Lines to scroll when cursor leaves screen
set scrolloff=3                   " Minimum lines to keep above and below cursor
set nospell                       " disable spell check
set nohidden                      " disable switch buffer without saving
set relativenumber                " use relative line instead of absolute
set noundofile                    " avoid persistent undo
set autoread                      " reload files when changed on disk, i.e. via `git checkout`
set shortmess+=filmnrxoOtT        " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore           " Allow for cursor beyond last character
set history=1000                  " Store a ton of history (default is 20)
set iskeyword-=.                  " '.' is an end of word designator
set iskeyword-=#                  " '#' is an end of word designator
"set iskeyword-=-                 " '-' is an end of word designator
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set list
set listchars=tab:▸\ ,trail:▫,nbsp:×,precedes:×,extends:#,nbsp:. " Highlight problematic whitespace

" Folding config
set foldmethod=indent             " not as cool as syntax, but faster
set foldlevelstart=1              " start unfolded
highlight Folded ctermbg=234
highlight Folded ctermfg=black

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

if has('clipboard')
  if has('unnamedplus')    " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

source ~/.vimrc.functions
source ~/.vimrc.plugins
source ~/.vimrc.keybindings

" Use local gvimrc if available and gui is running
if has('gui_running')
  set guioptions-=T             " Remove the toolbar
  set lines=40                " 40 lines of text instead of 24
  set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
  if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
  endif
else
  if &term == 'xterm' || &term == 'screen'
    set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
  endif
endif
