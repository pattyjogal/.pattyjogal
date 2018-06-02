" Set up powerline functionality

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Dumb fix
" set timeoutlen=30 ttimeoutlen=0
" Assistance config for powerline
set noshowmode
set laststatus=2

" vim-plug
call plug#begin()

" Chris Kempson's Base-16 theme
Plug 'chriskempson/base16-vim'
Plug 'terlar/base16-vim-powerline'

" Autocompletion
Plug 'Valloric/YouCompleteMe'

" FileFinding
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" I don't type so good
Plug 'Chiel92/vim-autoformat'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'tpope/vim-commentary'

" Webdev
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

" Version Control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" Change the colorscheme
colorscheme base16-default-dark
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors

let g:Powerline_colorscheme = 'base16'

" Relative line numbering
set number relativenumber

" YCM Settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif


" Keybinds
noremap <F9> :Autoformat<CR>
noremap <F10> :FormatCode<CR>
map <F7> :b#<CR>
"
" I like my indents small
set tabstop=4

" HTMLDjango Indent Fix
au FileType htmldjango setl sw=2 sts=2 et

" NERDTree thinks it deserves all that room? Hah!
:let g:NERDTreeWinSize=50
