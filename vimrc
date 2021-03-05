filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/

" mark width 80
set colorcolumn=80

" To format block selection: gq
autocmd BufNewFile,BufRead *.md,*.txt set textwidth=80

" line numbering
set nu
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr ctermbg=Yellow

set scrolloff=10

syntax enable
set bg=light

" To enable mouse scroll in byobu+tmux
" https://unix.stackexchange.com/a/50735
set ttymouse=xterm2
set mouse=a

" Automatic bracket closing for vanilla vim
" https://stackoverflow.com/a/34992101
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
