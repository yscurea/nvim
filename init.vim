let s:dein_dir = expand('~/.config/nvim/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:rc_dir = expand('~/.config/nvim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

colorscheme hybrid
highlight ColorColumn guibg=#202020 ctermbg=lightgray
filetype plugin indent on
syntax enable
set encoding=UTF-8
set guifont=Hack:h11
set guifontwide=Hack:h11
set number
set wrap
set autoread
set autoindent
set smartindent
set showcmd
set wildmenu
set showmatch
set pumblend=15
set cursorline
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
set hidden
set nobackup
set noswapfile
set nowritebackup
set cmdheight=1
set updatetime=300
set laststatus=2
set colorcolumn=80
set clipboard+=unnamedplus
set autochdir

let mapleader = "\<Space>"
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <Leader>p :e ~/AppData/Local/nvim/dein.toml<CR>
nnoremap <Leader>i :source $MYVIMRC<CR>
nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
nnoremap <Leader>l gt
nnoremap <Leader>h g<S-t>
nnoremap s <Nop>
nnoremap <S-s> s
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap s<S-q> :<C-u>bd<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap s<S-j> <C-w>J
nnoremap s<S-k> <C-w>K
nnoremap s<S-l> <C-w>L
nnoremap s<S-h> <C-w>H
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
nnoremap s= <C-w>=
nnoremap s_ <C-w>_
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>e :tabe 
nnoremap <Leader>< :tabm -1<CR>
nnoremap <Leader>> :tabm +1<CR>
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <C-l> $
noremap <C-h> 0
noremap <C-j> +
noremap <C-k> -
noremap + <C-a>
noremap - <C-x>
nnoremap <silent><C-c><C-c> :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
nnoremap <Leader>t :bo term<CR>
nnoremap <Leader>a @:
onoremap 8 i(
onoremap 2 i"
onoremap 7 i'
onoremap @ i`
onoremap [ i[
onoremap { i{
inoremap jj <ESC>
inoremap <C-l> <Del>
inoremap <C-k> <C-o>k
tnoremap jj <C-\><C-n>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" recover session {
au VimLeave * mks!  ~/vimsession
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ~/vimsession | endif
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
" }
