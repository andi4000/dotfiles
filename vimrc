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

" solarized
" needs ~/.vim/colors/solarized.vim
" set bg=light to switch
syntax enable
colorscheme solarized
set bg=dark

" To enable mouse scroll in byobu+tmux
" https://unix.stackexchange.com/a/50735
set ttymouse=xterm2
set mouse=a
