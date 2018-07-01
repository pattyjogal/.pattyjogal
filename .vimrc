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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'

" Webdev
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/Colorizer'

" Django
Plug 'tweekmonster/django-plus.vim'

" Version Control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Python
Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
Plug 'mgedmin/python-imports.vim'
Plug 'avakhov/vim-yaml'

" Rust
Plug 'cespare/vim-toml'
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

let &t_ut=''

" Keybinds
noremap <F9> :Autoformat<CR>
noremap <F10> :FormatCode<CR>
map <F7> :w<CR> :b#<CR>
noremap <F5> :ImportName<CR>


" I like my indents small
set tabstop=4

" HTMLDjango Indent Fix
au FileType htmldjango setl sw=2 sts=2 et

" NERDTree thinks it deserves all that room? Hah!
:let g:NERDTreeWinSize=50

" Python
" let g:pymode_python = 'python3'
" let g:pymode_rope = 1
" let g:pymode_rope_autoimport = 1
" let g:ropevim_autoimport_modules = ["os.*","traceback","django.*","typings"]
" let g:pymode_rope_autoimport_modules = ["os.*","traceback","django.*", "typings"]
" let g:pymode_lint_cwindow = 0

" Git
set diffopt+=vertical

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<Right>"
let g:UltiSnipsJumpBackwardTrigger="<Left>"

" Possibly the coolest Django mapping ever
let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
    " This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()
set expandtab ts=4 sw=4 ai

" Underline settings
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" Linter settings
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '●'
let g:ale_sign_column_always = 1
let g:ale_python_pylint_options = "--load-plugins=pylint_django --max-line-length=100"
hi ALEError gui=undercurl guisp=red cterm=undercurl
hi ALEWarning gui=undercurl guisp=red cterm=undercurl

set tags=tags
