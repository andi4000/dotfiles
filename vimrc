filetype plugin indent on

set number
syntax enable

" better scrolling
set scrolloff=10

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/

" To format block selection: gq
autocmd BufNewFile,BufRead *.md,*.txt set textwidth=80

" Set Tab Width to 2 for yaml files
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

" For python-black autoformatter, 88 line width
autocmd Filetype python setlocal colorcolumn=89

" Syntax highlighting for Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" enable mouse
set mouse=a

" mouse scroll fix in byobu+tmux
" https://unix.stackexchange.com/a/50735
" not for macos iterm2
"set ttymouse=xterm2

