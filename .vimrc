set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tshirtman/vim-cython'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'coyotebush/vim-pweave'
Plug 'vim-scripts/colorsupport.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/PapayaWhip'
Plug 'zanglg/nova.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'

call plug#end()

filetype plugin indent on    " required

set synmaxcol=80
set nocompatible
set ttyfast
set lazyredraw

" NerdTree mapping
map <F2> :NERDTreeToggle<CR>

" Synastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " 
set statusline+=[%{strlen(&ft)?&ft:'none'}]  " filetype
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%{fugitive#statusline()}
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Use spaces by default
set ts=4
set shiftwidth=4
set softtabstop=4 " makes the spaces feel like real tabs
set expandtab
set number

" makefiles need tabs
autocmd FileType make setlocal noexpandtab

" REMINDER: gq line wraps
" text markup settings
"au BufRead,BufNewFile *.md setlocal textwidth=100

let orgfoldexpr=&foldexpr
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math = 1
autocmd FileType markdown setlocal spell|setlocal textwidth=100

au BufRead,BufNewFile *.rst setlocal textwidth=100
autocmd FileType rst setlocal spell
au BufRead,BufNewFile *.tex setlocal textwidth=100
autocmd FileType tex setlocal spell
au BufRead,BufNewFile *.texw setlocal textwidth=100
autocmd FileType Pweave setlocal spell

" Python specific settings
augroup vimrc_autocmds
    autocmd!
	" highlight characters past column 80
    autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set textwidth=80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%80v.*/
	autocmd FileType python set nowrap

    autocmd FileType cython set tabstop=4|set shiftwidth=4|set expandtab|set textwidth=80
	autocmd FileType cython set nowrap
augroup END

" Make the leader comma
let mapleader=","

" fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" turn on syntax highlighting
if has("syntax")
    syntax on
endif

set showmatch

" Im a bad vimmer, gimme mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Makes backspace work in insert mode on osx
set backspace=indent,eol,start
set t_Co=256
set background=light
colorscheme nova
