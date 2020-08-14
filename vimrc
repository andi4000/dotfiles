filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/

" max width
" https://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set textwidth=80

" line numbering
set nu
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr ctermbg=Yellow

set scrolloff=10
