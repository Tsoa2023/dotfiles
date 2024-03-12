set tabstop=4 shiftwidth=4 noexpandtab
set number
set relativenumber
set autoindent

"nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

	map + :resize +1<CR>
	map - :resize -1<CR>
	map ) :vertical resize +1<CR>
	map ( :vertical resize -1<CR>


" Always show the status line
	set laststatus=2

" Reload .vimrc
	nnoremap <F12> :so $MYVIMRC<CR>

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'nordtheme/vim'
Plug 'tpope/vim-surround'

	Plug 'junegunn/vim-easy-align'
	Plug 'godlygeek/tabular'
	Plug 'alvan/vim-closetag'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-capslock'
	Plug 'wellle/targets.vim'
	Plug 'christoomey/vim-sort-motion'
	Plug 'terryma/vim-expand-region'
	Plug 'Valloric/MatchTagAlways'
	Plug 'FooSoft/vim-argwrap'
	Plug 'gerardbm/vim-md-headings'
	Plug 'gerardbm/vim-md-checkbox'
	Plug 'matze/vim-move'

	 Plug 'cacharle/c_formatter_42.vim'

call plug#end()

colorscheme nord
