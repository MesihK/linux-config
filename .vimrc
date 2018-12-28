" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set t_Co=256
set background=dark

set hlsearch
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set encoding=utf8
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'file:///home/mesih/.vim/bundle/scripts/'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'arrufat/vala.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nu

" Don't force me to save when switching buffers
"set hidden

" sudo write this
cmap W! silent w !sudo tee % >/dev/null

" for pure hard tabs
" set tabstop=4
" set shiftwidth=4
" set noexpandtab
"
" for black and white print outputs
set printoptions+=syntax:n

" for linux kernel development
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set colorcolumn=80

" for pure spaces
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab

" Always display the status line
"set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
" set cursorline

" Theme and Styling 
syntax on
set title

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

set nowrap
set nobackup
set nowritebackup
set swapfile
set dir=/tmp

"vim airline
let g:airline#extensions#tabline#enabled = 1

"NERDTree
"autocmd vimenter * NERDTree

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
" nnoremap <Leader>l :ls<CR>
" nnoremap <Leader>b :bp<CR>
" nnoremap <Leader>f :bn<CR>
" nnoremap <Leader>g :e#<CR>
" nnoremap <Leader>1 :1b<CR>
" nnoremap <Leader>2 :2b<CR>
" nnoremap <Leader>3 :3b<CR>
" nnoremap <Leader>4 :4b<CR>
" nnoremap <Leader>5 :5b<CR>
" nnoremap <Leader>6 :6b<CR>
" nnoremap <Leader>7 :7b<CR>
" nnoremap <Leader>8 :8b<CR>
" nnoremap <Leader>9 :9b<CR>
" nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile
nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>ja :YcmCompleter GoTo<CR>
nnoremap <leader>jh :YcmCompleter GoToInclude<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

vnoremap L >gv
vnoremap H <gv

let g:livepreview_previewer = 'zathura'

inoremap ,s Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>

