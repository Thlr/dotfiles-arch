set hidden
let mapleader=" "
let maplocalleader=","
set clipboard+=unnamedplus
set updatetime=100

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

" fast buffer navigation
nnoremap <F5> :buffers<CR>:buffer<Space>
"nmap <Tab> :tabn<CR>

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

" tab navigation

nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>

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

" Personal wiki
Plug 'vimwiki/vimwiki'

" eye candy
Plug 'vim-airline/vim-airline' " status bar (needs special fonts)
Plug 'ryanoasis/vim-devicons' " various symbols (linux, rust, python, ...)
Plug 'sheerun/vim-polyglot' " better language support

" themes
Plug 'morhetz/gruvbox' " very nice and soft color theme
Plug 'rakr/vim-one' " super cool looking theme
Plug 'joshdick/onedark.vim'
Plug 'sts10/vim-pink-moon'
Plug 'liuchengxu/space-vim-dark'
Plug 'jacoborus/tender.vim'

" Quality of life plugins
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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

" view classes
Plug 'preservim/tagbar'

call plug#end()

""""""""""""""
" Aesthetics "
""""""""""""""

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme onedark

" transparent bg
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
"hi StatusLine guibg=NONE ctermbg=NONE
"hi StatusLineNC guibg=NONE ctermbg=NONE
"hi VertSplit guibg=NONE ctermbg=NONE

" Non transparent bg
" set background=dark

let g:airline_powerline_fonts = 1
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""""""""""""""""""""""""
" OTHER PLUGINS CONFIG "
""""""""""""""""""""""""

" Vim gutter (git integration)
" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
let g:gitgutter_override_sign_column_highlight = 1
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

" coc nvim

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-texlab',
    \ 'coc-markdownlint',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-yaml',
    \ ]
"    \ 'coc-snippets',
"    \ 'coc-pairs',
"    \ 'coc-jedi',

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
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CHADTree
" nnoremap <leader>v <cmd>CHADopen<cr>

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
nmap <C-n> :TagbarToggle<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/sync/wiki', 'syntax': 'markdown', 'ext': '.md'}]
" Diary template
au BufNewFile ~/sync/wiki/diary/*.md :silent 0r !~/.local/bin/vimwiki-diary-template '%'
