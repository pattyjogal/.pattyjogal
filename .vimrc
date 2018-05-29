" Set up powerline functionality

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Assistance config for powerline
set ttimeoutlen=50
set noshowmode
set laststatus=2

" vim-plug
call plug#begin()

" Chris Kempson's Base-16 theme
Plug 'chriskempson/base16-vim'
Plug 'terlar/base16-vim-powerline'

call plug#end()

" Change the colorscheme
colorscheme base16-default-dark
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors

let g:Powerline_colorscheme = 'base16'

" Relative line numbering
set number relativenumber


