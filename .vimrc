"set up tabs"
set tabstop=2 shiftwidth=2 expandtab

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

map <F1><Down> :res -3 <CR>
map <F1><Up> :res +3 <CR>
map <F1><Left> :vertical resize -3 <CR>
map <F1><Right> :vertical resize +3 <CR>/*{{{*//*}}}*/

"will open new window on the rigth
set splitright
set splitbelow
noremap <F2><Right> :vsp<CR> <C-]> \| :set cursorline<CR> \| :wincmd w<CR> 
noremap <F2><Down> :sp<CR> <C-]> \| :set cursorline<CR> \| :wincmd w<CR> 

noremap <F3><down> :wincmd j<CR>
noremap <F3><up> :wincmd k<CR>
noremap <F3><right> :wincmd l<CR>
noremap <F3><left> :wincmd h<CR>
noremap <F3><Space> :q<CR>
noremap <F3><Tab> :only<CR>

noremap <F4><right> :vsp<CR>
noremap <F4><down> :sp<CR>

"goes to current file selected under cureser"
"nmap <F5> :cs find f <cfile> <CR>
noremap <F5> :w! \|:cs find f <cfile> <CR>

"Find callres of this functions"
nmap <F6> :cs find c <cfile> <CR>
"Find symbols"
nmap <F7> :cs find s <cfile> <CR>

"show trailing"
nnoremap <F9><Up> :call Tt_d()<CR>
"toggle spelling
nnoremap <F9><Down> :call Spell_d()<CR>
"toggle highlight
nnoremap <F9><Left> :set cursorcolumn!<CR>
"toggle highlight
nnoremap <F9><Right> :set cursorline!<CR>
"toggle numbers
nnoremap <F9><space> :set number!<CR>


function Marker()
  :set foldmethod=marker 
  :set foldmarker=#if,#endif
endfunction


"chang directoy to current file"
nmap <F10><left> :lcd %:p:h <CR>
"chang directoy to current file"
nmap <F10><Up> :set foldmethod=syntax <CR>
nmap <F10><Down> :call Marker() <CR>
nmap <F10><Right> :%!xxd <CR>


"used for tagbar"
nmap <F12> :TagbarToggle<CR>

"auto complete"
imap <Insert> <C-n>
"highlight"
nmap <Delete> :set hlsearch! <CR>

"set up autoload (CSCOPE)"
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"Auto find CTAGS" - export:
set tags=./tags;,tags;

"nnoremap <Space> za

"fold based on syntax, and don't ever fold automatiicaly"
"so ~/.vim/plugin/ifdef.vim
"//:set foldmarker=#if,#endif
:set foldmarker={,}
:set foldlevel=99

":colorscheme gruvbox
:set bg:dark
:let g:gruvbox_contrast_dark = 'hard'

:map <C-o> :execute "Define" expand("<cword>")<CR>
:map <C-p> :execute "Undefine" expand("<cword>")<CR>
:set t_ut=
 
function Trailing()
  set list
  set listchars+=trail:◦
endfunction

function Tabs()
  set list
  set listchars=tab:>-
endfunction

function Tt()
  set list
  set listchars+=trail:◦
  set listchars+=tab:->
endfunction

function Tt_d()
  set listchars=tab:>-
  set listchars+=trail:◦
  set list!
endfunction

function Spell()
  set spell
endfunction

function Spell_d()
  set spell!
endfunction

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Up> :tabnew<CR>
nnoremap <C-x> :Explor<CR>
nnoremap <C-Down> :tabclose<CR>
