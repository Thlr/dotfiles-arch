set hidden
let mapleader=" "
let maplocalleader=","
set clipboard+=unnamedplus
set updatetime=100
set timeoutlen=500
set showcmd

set nocompatible

filetype plugin indent on

syntax on

" enable folding
set foldmethod=indent
set foldlevel=99

set mouse=a

set wildmode=longest,list,full

set splitbelow splitright

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" hybrid line numbers
set rnu nu

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

""""""""""""
" BINDINGS "
""""""""""""

" Auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Spell check
map <leader>sfr :setlocal spell! spelllang=fr<CR>
map <leader>sen :setlocal spell! spelllang=en_us<CR>

" Auto indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" tab navigation
map <leader>J :tabnext<CR>
map <leader>K :tabprev<CR>
map <leader>t :tabs<CR>:tab<Space>

" buffer navigation
map <leader>j :bnext<CR>
map <leader>k :bprev<CR>
map <leader>b :buffers<CR>:buffer<Space>

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
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons' " various symbols (linux, rust, python, ...)
Plug 'sheerun/vim-polyglot' " better language support (syntax and identation)

" themes
Plug 'morhetz/gruvbox' " very nice and soft color theme
Plug 'rakr/vim-one' " super cool looking theme
Plug 'joshdick/onedark.vim'
Plug 'sts10/vim-pink-moon'
Plug 'liuchengxu/space-vim-dark'
Plug 'jacoborus/tender.vim'

" Quality of life plugins
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'kien/ctrlp.vim'

" LaTeX editing
Plug 'vim-latex/vim-latex'
Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'} " Live preview of LaTeX PDF output

" autocompletion and snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" R editing
Plug 'jalvesaq/Nvim-R'

" Markdown tools
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Go programming
Plug 'fatih/vim-go'

" view classes
Plug 'preservim/tagbar'

call plug#end()

""""""""""""""
" Aesthetics "
""""""""""""""

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme tender

" Vim gutter (git integration)
" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

let g:gitgutter_hilight_lines = 0

" transparent bg
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE

" Non transparent bg
" set background=dark

""""""""""""""""""""""""
" OTHER PLUGINS CONFIG "
""""""""""""""""""""""""

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
let g:livepreview_engine = 'pdflatex' . '-shell-escape'

" Nvim-R
" remapping the basic :: send line
nmap <leader>; <Plug>RDSendLine
" remapping selection :: send multiple lines
vmap <leader>; <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
vmap <leader>;e <Plug>RESendSelection

" Go setup
" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

"" NerdTree
nnoremap <leader>v <cmd> NERDTreeToggle<cr>
" Open if no file is specified, if vim is opened on a directory or close vim
" if nerdtree is the last tab open
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Nerdtree syntax hilighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" tagbar
nmap <leader>n :TagbarToggle<CR>

""""""""""""
" COC NVIM "
""""""""""""

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-texlab',
    \ 'coc-markdownlint',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ ]
"    \ 'coc-pairs',

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Navigate diagnostics
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
