set nocompatible
set backspace=2
set ruler
syntax off
set nonu
set wrap

" nerdtree
nnoremap <S-t> :NERDTreeToggle<CR>

" save, quit without save
nnoremap <C-x> :q!<CR>
nnoremap <C-o> :w<CR>

" +fzf if installed using git
set rtp+=~/.fzf
nnoremap <C-t> :FZF<CR>

" toggle line number
nnoremap <S-l> :set invnu<CR>
" toggle line wrap
nnoremap <S-w> :set invwrap<CR>
" toggle syntax
nnoremap <S-s>
             \ : if exists("syntax_on") <BAR>
             \    syntax off <BAR>
             \ else <BAR>  
             \    syntax enable <BAR>
             \ endif<CR>
" buffer
nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>

set laststatus=2
