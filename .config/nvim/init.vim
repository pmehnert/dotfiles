""         _
""  __   _(_)_ __ ___  _ __ ___
""  \ \ / / | '_ ` _ \| '__/ __|
""   \ V /| | | | | | | | | (__
""    \_/ |_|_| |_| |_|_|  \___|
""


set nocompatible
set encoding=utf-8
set backupext=.bak
let mapleader=','

" Add ~/.vim to runtimepath and packpath
if has('nvim')
    set runtimepath+=~/.vim/after runtimepath+=~/.vim
    set packpath+=~/.vim/after packpath+=~/.vim
endif

"" Plugins
" set runtimepath+=~/.vim/bundle/Vundle.vim

if has('autocmd')
    filetype plugin indent on

    "" Delete all trailing white spaces on save
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePost ~/.vimrc,*vimrc source ~/.vimrc
endif

"" General
set ruler number relativenumber list
set lcs=tab:>-,trail:-,extends:>,precedes:<,eol:¬
set linebreak
set showbreak=+++
set textwidth=120
set updatetime=300
set cmdheight=2
set nowrap showmatch
set hidden
set ignorecase
set wildmode=longest,list,full
set scrolloff=2
set cmdheight=1
set textwidth=0
set backspace=indent,eol,start
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab autoindent
set splitbelow splitright
set foldmethod=manual
set mouse=a
set shortmess+=c
set signcolumn=number

" set cot=menuone,noinsert
" set shm+=c

set guifont=JetBrainsMono_Nerd_Font:h12

syntax enable

""" Setting support for True color
if has("termguicolors")
    set termguicolors
endif


lua require('plugins')
lua require('lsp')

"" let g:gruvbox_contrast_dark = 'hard'
let g:onedark_terminal_italics = 1
let g:onedark_color_overrides = {
\ "background": {"gui": "#1D2021", "cterm": "235", "term": "0"}
\}

if has('nvim')
    colorscheme onedark
else
    colorscheme slate
endif

"" Define key mappings for tabs and splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
map <C-n> :tabp<CR>
map <C-m> :tabn<CR>

map <leader>sp :split<CR>
map <leader>vs :vsplit<CR>
map <leader>c :tabnew<CR>

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> :%s//g<Left><Left>

map <leader>w :w<CR>
map <leader>qw :wq<CR>
map <leader>qq :q<CR>
map <leader>qa :qa<CR>

vnoremap <leader>p "_dp


" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)


" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf <Plug>(coc-fix-current)

" " Run the Code Lens action on the current line.
" nmap <leader>cl <Plug>(coc-codelens-action)

" command! -nargs=0 Format :call CocActionAsync('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call CocActionAsync('runCommand', 'editor.action.organizeImport')


"" Airline Configuration
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#vimtex#enabled = 1

" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

