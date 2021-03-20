call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/limelight.vim'
call plug#end()

set clipboard+=unnamedplus
set number
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set hidden

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" disable keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <space> <nop>

" color scheme
" Unified color scheme (default: dark)
colo seoul256

" Light color scheme
colo seoul256-light

" Toggle colors
set background=dark

function ToggleColors()
    if (g:colors_name == "seoul256")
        colorscheme seoul256-light
    else
        colorscheme seoul256
    endif
endfunction

nnoremap <F8> :call ToggleColors()<CR>

" <<< key bindings >>>

" leader key
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;next buffer
nnoremap <leader>tn gt ;next tab

" <<< Plugins config >>>

" csv.vim
autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
autocmd BufWritePre *.csv :%UnArrangeColumn

" winresizer
let g:winresizer_start_key = "<leader>w"

" vim-mundo
nnoremap <leader>ut :MundoToggle<cr> ;toggle undo tree

" vim-bbye
nnoremap <leader>q :Bdelete<cr> ;delete buffer

" Limelight
nnoremap <F9> :Limelight<cr>
nnoremap <F10> :Limelight!<cr>
