syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~./config/nvim/undodir
set undofile
set incsearch
set mouse+=a

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')
"themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
"auto complete coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " c++ extension -> cocInstall coc-clangd 
" use git in vim
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Requires nodejs and yarn 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mxw/vim-jsx'
call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" genius remap by the primeage (in visual mode, deletes into the void register and pastes what is in your paste register)
vnoremap <leader>p "_dP
" same thing but no paste (there is probably a proper way of doing this by default) 
vnoremap <leader>d "_d

inoremap kj <Esc>

nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<R>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndooreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>stl :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>qq :q<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>in :e ~/.config/nvim/init.vim<CR>
" remove line numbers
nnoremap <Leader>nn :set invnumber<CR>
" fzf binds
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

map <leader>ff :<C-U>!g++ -o -Wall -Wextra %:r.cpp -o %:r<CR>
map <F9> :<C-U>!%:r<CR>
noremap <Leader>yy ggvG"+y 

source $HOME/.config/nvim/plug-config/coc.vim
"not sure about this 
