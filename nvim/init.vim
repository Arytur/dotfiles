set clipboard+=unnamedplus
set number
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
