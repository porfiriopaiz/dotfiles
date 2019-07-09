" VIM-PLUG BLOCK
" My plugins
call plug#begin('~/.vim/plugged')
"Plug 'ambv/black'
"Plug 'bfrg/vim-cpp-modern'
"Plug 'davidhalter/jedi'
"Plug 'davidhalter/jedi-vim'
"Plug 'fisadev/vim-isort'
"Plug 'godlygeek/tabular'
"Plug 'mattn/emmet-vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'plasticboy/vim-markdown'
"Plug 'python-mode/python-mode'
"Plug 'scrooloose/nerdtree'
"Plug 'townk/vim-autoclose'
"Plug 'vim-latex/vim-latex'
"Plug 'wellle/targets.vim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --all' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'

" VIM colors
"Plug 'KeitaNakamura/neodark.vim'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'albertocg/contrastneed-theme'
"Plug 'blindFS/flattr.vim'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'gertjanreynaert/cobalt2-vim-theme'
"Plug 'levex/vim-monochrome'
"Plug 'morhetz/gruvbox'
"Plug 'philpl/vim-adventurous'
"Plug 'tomasr/molokai'
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'zanglg/nova.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'raphamorim/lucario'
call plug#end()

" BASIC SETTINGS
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Enable filetype detection:
filetype on
filetype plugin on
filetype indent on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" vim powerline configs
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

" NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
:set colorcolumn=80
:highlight ColorColumn ctermbg=black guibg=#592929

" Enable line numbers
set number

" Highlight current line
set cursorline

" Solarized theme
syntax enable
set background=dark
colorscheme solarized

" Color Schemes
"colorscheme solarized
"colorscheme lucario
"colorscheme dracula
"colorscheme gruvbox

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim isort
"let g:vim_isort_map = '<C-i>'

" python-mode
"hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

" PEP8
" To add the proper PEP8 indentation, add the following to your .vimrc:
"au BufNewFile,BufRead *.py:
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python Version for YCM
"let g:ycm_server_python_interpreter = '/usr/bin/python3'
"let g:ycm_global_ycm_extra_conf = '$HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"
"let g:ycm_python_interpreter_path = ''
"let g:ycm_python_sys_path = []
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
"let g:ycm_python_binary_path = 'python'

" Text width
set textwidth=79

" Fix vim-latex mapping overwriting.
"nmap <C-F> <Plug>IMAP_JumpForward

" Black
"let g:black_fast (defaults to 0)
"let g:black_linelength = 79
"let g:black_skip_string_normalization (defaults to 0)
"let g:black_virtualenv (defaults to ~/.vim/black)

" Undo file and dir
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Point YCM to the Pipenv created virtualenv, if possible
" At first, get the output of 'pipenv --venv' command.
let pipenv_venv_path = system('pipenv --venv')
" The above system() call produces a non zero exit code whenever
" a proper virtual environment has not been found.
" So, second, we only point YCM to the virtual environment when
" the call to 'pipenv --venv' was successful.
" Remember, that 'pipenv --venv' only points to the root directory
" of the virtual environment, so we have to append a full path to
" the python executable.
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python'
else
  let g:ycm_python_binary_path = 'python'
endif
