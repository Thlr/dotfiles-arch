let mapleader=" "
let maplocalleader=","
set clipboard+=unnamedplus

set nocompatible

filetype plugin indent on

syntax on

" enable folding
set foldmethod=indent
set foldlevel=99

set mouse=a

set wildmode=longest,list,full

set splitbelow splitright

""""""""""""
" BINDINGS "
""""""""""""

" fast buffer navigation
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <Tab> :tabn<CR>

" split navigations
let g:BASH_Ctrl_j = 'off'
let g:C_Ctrl_j = 'off'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Spell check
map <leader>sfr :setlocal spell! spelllang=fr<CR>
map <leader>sen :setlocal spell! spelllang=en_us<CR>

" Auto indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

""""""""""
" VISUAL "
""""""""""

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
set rnu nu " hybrid line numbers

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Disable the bell for intellij
set visualbell
set noerrorbells

" Color column at 80 char
augroup collumnLimit
    autocmd!
    autocmd BufEnter,WinEnter,FileType python,tex
                \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
    let collumnLimit = 79 " feel free to customize
    let pattern =
                \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
    autocmd BufEnter,WinEnter,FileType python,tex
                \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"""""""""""
" PLUGINS "
"""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged') " for neovim

Plug 'tpope/vim-sensible' " sane defaults

" eye candy
Plug 'vim-airline/vim-airline' " status bar (needs special fonts)
Plug 'ryanoasis/vim-devicons' " various symbols (linux, rust, python, ...)
" Plug 'deviantfero/wpgtk.vim' " Automatic theme based on wallpaper
Plug 'sheerun/vim-polyglot' " better language support
" themes
Plug 'morhetz/gruvbox' " very nice and soft color theme
Plug 'rakr/vim-one' " super cool looking theme
Plug 'joshdick/onedark.vim'
Plug 'git@gitlab.com:yorickpeterse/happy_hacking.vim.git'
Plug 'sts10/vim-pink-moon'
Plug 'liuchengxu/space-vim-dark'
Plug 'jacoborus/tender.vim'

" Quality of life plugins
Plug 'scrooloose/nerdtree' " browse files tree
" Plug 'junegunn/fzf' " fuzzy files finding
Plug 'kien/ctrlp.vim'

" LaTeX editing
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'} " Live preview of LaTeX PDF output

" autocompletion and snippets
" Plug 'zxqfl/tabnine-vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ycm-core/YouCompleteMe'

" R editing
Plug 'jalvesaq/Nvim-R'

" Markdown tools
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Go programming
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

call plug#end()

""""""""""""""
" Aesthetics "
""""""""""""""
color tender
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark

let g:airline_powerline_fonts = 1
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

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

" Vim gutter (git integration)
" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
" let g:gitgutter_override_sign_column_highlight = 1
set updatetime=150
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" Crtp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"LaTeX editing and preview config
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0
" let g:livepreview_engine = 'xelatex'

" Nvim-R
" remapping the basic :: send line
nmap ; <Plug>RDSendLine
" remapping selection :: send multiple lines
vmap ; <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
vmap ;e <Plug>RESendSelection

" Go setup
" vim-delve
nmap <Leader>b <Plug>(DlvToggleBreakPoint)
" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

"""""""
" COC "
"""""""
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-texlab',
    \ 'coc-markdownlint',
    \ 'coc-go',
    \ 'coc-highlight',
    \ ]
"    \ 'coc-snippets',
"    \ 'coc-pairs',

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "<C-n>" :
      \ <SID>check_back_space() ? "<Tab>" :
      \ coc#refresh()

" configure maralla/completor to use tab
" other configurations are possible (see website)
inoremap <expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "<C-y><cr>" : "<cr>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    silent call CocActionSync('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocAction('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
