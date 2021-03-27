call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'junegunn/limelight.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'itchyny/lightline.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-rhubarb'
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvim-lua/diagnostic-nvim'
    Plug 'sbdchd/neoformat'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" -----------------------------------------------------------
" nighty
" Loads lua config
lua require('init')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
filetype plugin on
set updatetime=300
set completeopt=menuone
set completeopt+=noinsert
set completeopt-=preview
set shortmess+=c

" Status Line
set statusline=%<%f\ %h%m%r
set statusline+=%=%-10.60{LspStatus()}\ %-.(%l,%c%V%)\ %P

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
" -----------------------------------------------------------

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
colorscheme PaperColor
set background=dark
" Toggle colors
nnoremap <F8> :let &bg=(&bg=='light'?'dark':'light')<cr>

" <<< key bindings >>>

" leader key
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;next buffer
nnoremap <leader>tn gt ;next tab

" <<< Plugins config >>>

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

" winresizer
let g:winresizer_start_key = "<leader>r"

" ranger
let g:ranger_replace_netrw = 1

" vim-mundo
nnoremap <leader>ut :MundoToggle<cr> ;toggle undo tree

" vim-bbye
nnoremap <leader>q :Bdelete<cr> ;delete buffer

" lightline
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

" Limelight
nnoremap <F9> :Limelight<cr>
nnoremap <F10> :Limelight!<cr>
