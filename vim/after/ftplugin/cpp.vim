set autochdir
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set textwidth=79
" Automatically closing braces
inoremap {<CR> {<CR>}<ESC>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
" Compile and Run
map <F9>  :<C-U>!g++ -O2 -std=c++14 -Wall -Wextra -O2 -Wshadow -Wconversion %:r.cpp -o %:r<CR>
map <F5> :<C-U>!./%:r<CR>
