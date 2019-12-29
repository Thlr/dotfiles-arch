"" Théo Larue's vim config file, intended to use with neovim but surely
"" compatible with vim
"" Originally based on the vim 8 config file by Ensimag

"" - install plug with :
""      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"" (see https://github.com/junegunn/vim-plug)
"" - install the languageserver server for each language you indend to use :
""    * pyls for python (see https://github.com/palantir/python-language-server)
""    * rls for rust (see https://github.com/rust-lang-nursery/rls)
""    * clangd for c
"" - you need to install jedi for python auto-completion
"" - install some font with powerline symbols for eye candy and icons
"" (see https://github.com/powerline/fonts)
"" - You may want to install nerd fonts for more compatibility with airline and vim
"" devicons https://github.com/ryanoasis/nerd-fonts

"" after that copy this file as your $HOME/.config/nvim/init.vim (or ~/.vimrc for classic vim) and execute :PlugInstall

set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged') " for neovim

Plug 'tpope/vim-sensible' " sane defaults

" eye candy
Plug 'vim-airline/vim-airline' " status bar (needs special fonts)
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox' " very nice and soft color theme
Plug 'ryanoasis/vim-devicons' " various symbols (linux, rust, python, ...)
Plug 'deviantfero/wpgtk.vim' " Automatic theme based on wallpaper


" not essential
Plug 'tpope/vim-fugitive' " git
Plug 'scrooloose/nerdtree' " browse files tree
" Plug 'junegunn/fzf' " fuzzy files finding


" For stats on the code
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" LaTeX editing
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'} " Live preview of LaTeX PDF output

"GLSL syntax highlighting
Plug 'tikhomirov/vim-glsl'

" autocompletion
Plug 'zxqfl/tabnine-vim'

call plug#end()

filetype plugin indent on

" color cheme
colorscheme wpgtkAlt
au VimEnter * exec 'AirlineTheme wpgtk'

" airline :
" for terminology you will need either to export TERM='xterm-256color'
" or run it with '-2' option
let g:airline_powerline_fonts = 1
set laststatus=2
set encoding=utf-8

syntax on

let g:gruvbox_italic=1
set background=dark
set rnu nu " hybrid line numbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" replace tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" let's autoindent c files
au BufWrite *.c call LanguageClient#textDocument_formatting()

" NERDTree config
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" Automatically open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Shortcut for nerdtree
map <C-n> :NERDTreeToggle<CR>
"Close vim if the only window left open is nerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" fast buffer navigation
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <Tab> :tabn<CR>

" split navigations
let g:BASH_Ctrl_j = 'off'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable the bell for intellij
set visualbell
set noerrorbells

" code stats api key
let g:codestats_api_key = "SFMyNTY.VkdobGIyeHkjI016WTROZz09.G5HVXCuZwY3G0lw-AHTmHOhLt6kylmRgGvLOONWA7Xo"

" Jenkinsfile syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy

" yml files indent
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

" Latex live preview conf
autocmd FileType tex setl updatetime=1000
let g:livepreview_engine = 'pdflatex'
let g:livepreview_previewer = 'evince'

" Quick indentation formatting for the whole file
nnoremap <C-A-L> gg=G''

" Spell check
autocmd FileType tex set spell spelllang=en,fr

" Color column at 80 char
augroup collumnLimit
    autocmd!
    autocmd BufEnter,WinEnter,FileType scala,java,python,tex
                \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
    let collumnLimit = 79 " feel free to customize
    let pattern =
                \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
    autocmd BufEnter,WinEnter,FileType scala,java,python,tex
                \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END
hi Normal guibg=NONE ctermbg=NONE

" clipboard configuration for arch
:set clipboard=unnamedplus
