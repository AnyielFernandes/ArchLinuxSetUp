set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable 
set showcmd
set ruler 
set encoding=utf-8
set showmatch
set sw=4
set relativenumber
set laststatus=2
set noshowmode
set tabstop=4

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'tomasiser/vim-code-dark'

" IDE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mkitt/tabline.vim'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
"Plug 'zefei/vim-wintabs'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'

"Go specific support
Plug 'fatih/vim-go', { 'tag':'v1.22', 'do': ':GoUpdateBinaries' }

"Java language server
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

colorscheme codedark
set background=dark

"vim-go
let g:go_fmt_autosave = 0
let g:go_asmfmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_auto_sameids = 0 
let g:go_auto_info = 0 

"Airline
let g:airline_theme='minimalist'
let g:airline#extension#tabline#enabled = 1
let g:airline#extension#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 1

"indentLine
let g:indentLine_enabled = 1 
let g:indentLine_conceallevel = 2 
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239



"ALE
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0 

"Bufferline
let g:bufferline_echo = 0 

"Shortcuts
let mapleader=" " 
nmap <Leader>s <Plug>(easymotion-s2) 
nmap <Leader>nt :NERDTreeFind<CR> 
let NERDTreeQuitOnOpen=1 
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$' ]
nmap <Leader>J <Plug>(ale_previous_wrap)
nmap <Leader>K <Plug>(ale_next_wrap)
nmap <Leader>Go :GoRun<CR>
nmap <Leader>il :IndentLinesToggle<CR>


"Useful commands: 
":sp filename 	Open filename in horizontal split
":vsp filename 	Open filename in vertical split
"Ctrl-w h Ctrl-w ← 	Shift focus to split on left of current
"Ctrl-w l Ctrl-w → 	Shift focus to split on right of current
"Ctrl-w j Ctrl-w ↓ 	Shift focus to split below the current
"Ctrl-w k Ctrl-w ↑ 	Shift focus to split above the current
"Ctrl-w n+ 	Increase size of current split by n lines
"Ctrl-w n- 	Decrease size of current split by n lines

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>bd :bd<CR>
nmap <Leader>wq :wq<CR>
nmap ' $
vmap ' $
map <C-s> :w<CR>
nmap <C-l> :noh<CR>
vmap <C-l> :noh<CR>
nmap ñ %
vmap ñ %
nmap <C-i> o<Esc>
nmap <C-I> O<Esc>


"Move between splits
nmap <Leader>+ <C-w>+
nmap <Leader>- <C-w>-
nmap <Leader>= <C-w>=
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>h <C-w>h
nmap <Leader>l <C-w>l


"File management 
"Interesting commands: 
" 	:cd
" 	:lcd
" 	:newtab
" 	:e
" 	gt
nmap <Leader>fz :Files<CR> 
"  Go to tab by number
map <C-n> gt
map <C-m> gT
nmap <Leader>vim :tabnew /home/anyel/.config/nvim/init.vim<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to buffer by number
noremap <leader>b1 :1b<CR>
noremap <leader>b2 :2b<CR>
noremap <leader>b3 :3b<CR>
noremap <leader>b4 :4b<CR>
noremap <leader>b5 :5b<CR>
noremap <leader>b6 :6b<CR>
noremap <leader>b7 :7b<CR>
noremap <leader>b8 :8b<CR>
noremap <leader>b9 :9b<CR>
noremap <leader>bb :bnext<CR>

"Javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete



"====================================================================================================================
"=============================================COC-Extensions=========================================================
"====================================================================================================================
let g:coc_global_extensions = [
  "\ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-go','coc-clangd','coc-java','coc-html']





"from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
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
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

