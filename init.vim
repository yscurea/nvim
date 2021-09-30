" setting dein {
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
" }

:lua require('init')

" color {
set t_Co=256
set t_ut=""
colorscheme hybrid
highlight Search guibg=#220022 ctermbg=249
set colorcolumn=80
highlight ColorColumn guibg=#202020 ctermbg=236
" }
filetype plugin indent on
syntax enable
" use utf-8
set encoding=UTF-8
" set font
set guifont=Hack:h11
set guifontwide=Hack:h11
" set line number
set number
" wrap or nowrap
set wrap
set autoread
set autoindent
set smartindent
set showcmd
set wildmenu
set showmatch
set pumblend=15
set cursorline
set shiftwidth=4
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
" syncronize windows clipboard
set clipboard+=unnamedplus
" open terminal with current directory
set autochdir

" key mapping {
let mapleader = "\<Space>"
" config related {
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <Leader>i :source $MYVIMRC<CR>
" }
" remove highlight color by <C-c>
nnoremap <silent><C-c> :nohlsearch<CR>
" delete with don't save clipboard {
nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
" }
" replace C-w for s {
nnoremap s <Nop>
nnoremap sw s
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
" }
" tab related {
nnoremap <Leader>l gt
nnoremap <Leader>h g<S-t>
nnoremap <Leader>< :tabm -1<CR>
nnoremap <Leader>> :tabm +1<CR>
" }
" don't use arrow key {
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
" }
" cursor related {
noremap <C-l> $
noremap <C-h> 0
noremap <C-j> +
noremap <C-k> -
noremap + <C-a>
noremap - <C-x>
" }
" save file
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :q<CR>
" make easy to replace word on cursor
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
" make easy to handle editing inner words {
onoremap 8 i(
onoremap 2 i"
onoremap 7 i'
onoremap @ i`
onoremap [ i[
onoremap { i{
" }
" make easy to move cursor in insert-mode {
" inoremap <C-h> <BS> "(default)
inoremap <C-l> <Del>
inoremap <C-k> <C-o>k
" }
" set returning normal-mode to jj {
inoremap jj <ESC>
tnoremap jj <C-\><C-n>
" }
" }

" toggle terminal {
" ctrl + ; == <C-[> or <ESC>
nnoremap <C-[> :call ChooseTerm("term-slider", 1)<CR>
" nnoremap <C-^> :call ChooseTerm("term-pane", 0)<CR>
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
	" pane is visible
	if a:slider > 0
		:exe pane . "wincmd c"
	else
		:exe "e #"
	endif
    elseif buf > 0
	" buffer is not in pane
	if a:slider
		:exe "botright split"
		:exe "resize 15"
	endif
	:exe "buffer " . a:termname
    else
	" buffer is not loaded, create
	if a:slider
		:exe "botright split"
		:exe "resize 15"
	endif
	:terminal
	:exe "f " a:termname
    endif
endfunction
" }


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
