" Versioned .vim/ is symlinked to ~/.vim/dotfiles-symlink
" (Taken from https://github.com/nicdumz/dotfiles - not sure if this is
" necessary.)
set rtp +=~/.vim/dotfiles-symlink

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

"let g:solarized_termcolors=256
set t_co=256

" So that aliases can be used in vim shell commands (:! )
let $BASH_ENV = "~/.bash_aliases"

" Show line numbers
set number

" Show relative line numbers (useful for editing with linewise movements)
" set relativenumber

call plug#begin('~/.vim/plugged')

" "A universal set of defaults that (hopefully) everyone can agree on."
Plug 'tpope/vim-sensible'

" "With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces:
" 'be' (normal open) or 'bt' (toggle open / close) or 'bs' (force horizontal split open) or 'bv' (force vertical split open)"
Plug 'jlanzarotta/bufexplorer'

" Save sessions
Plug 'tpope/vim-obsession'

" Status line for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Smart text substition
"  Substituion - e.g: :%Subvert/facilit{y,ies}/building{,s}/g
"  Coercion - e.g: crs -> snake_case; crm -> MixedCase
Plug 'tpope/vim-abolish'

" To show diffs agaisnt source code repository
Plug 'mhinz/vim-signify'

" Show content of " registers
Plug 'junegunn/vim-peekaboo'

" Vim plugin for Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Auto-indent python code following pep8
Plug 'vim-scripts/indentpython.vim'

" YouCompleteMe
" Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --clangd-completer'}

" Syntax checker.
Plug 'vim-syntastic/syntastic'

" PEP 8 checker
Plug 'nvie/vim-flake8'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'altercation/vim-colors-solarized'

Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'

call plug#end()

" ::Plugin configurations::
" * air-line

" This requires fancy patched fonts, e.g. DejaVu Sans Mono for Powerline (10)
" See https://github.com/Lokaltog/powerline-fonts
" The gnome terminal and/or .Xresources must be configured for it.
" let g:airline_powerline_fonts = 1
" Different font names for different OSes. :h11 is for MacOS/win.
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Hack
    else
        set guifont=Hack:h11
    endif
endif

" * peekaboo (register content sidebar)

" Compact side-bar
let g:peekaboo_compact = 1

" * YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
" TODO: map keys
"python with virtualenv support for Ycm to work well.

if has("python3")
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" ::End Plugin configurations::

" I don't remember?
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Cycle through windows with ctrl+hjkl
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>

" EOF
" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on

" Bind paste mode toggle to F2.
set pastetoggle=<leader>p

" Enable syntax highlighting
syntax on
let python_highlight_all=1

set expandtab

" colorscheme solarized

" mutiple vulnerabilities.
set nomodeline

" Generic formatting stuff:
" Spaces intead of tabs
set expandtab
" 4 spaces for one tab
set tabstop=2
" Indentation size (e.g >>)
set shiftwidth=2
" something about tab indentation?
set softtabstop=4
" 120 long column
set textwidth=120
set autoindent
set fileformat=unix " ?

" Python PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag extraneous whitespace in red color.
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Primarly useful for python? Apparently...
" set encoding=utf-8

" Load more configurations from machine dependent file.
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
