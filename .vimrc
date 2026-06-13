set tabstop=4 shiftwidth=4 noexpandtab
set number
set relativenumber
set autoindent


set complete=w,b,u,t
set completeopt=longest,menuone

inoremap jk <Esc>
map <C-s> :w<CR>
inoremap { {}<Left><CR><Esc>O<Tab>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap [ []<Left>
nnoremap <leader>sv :source ~/.vimrc<CR>


