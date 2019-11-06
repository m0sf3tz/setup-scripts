set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

map <F1> :vertical resize +3 <CR>
map <F2> :vertical resize -3 <CR>
map <F3> :res +3 <CR>
map <F4> :res -3 <CR>

map <F5> :winc H <CR>

"enable tagbar"
nmap <F12> :TagbarToggle<CR>

"Enable go plugins"
filetype plugin on

"go-vim specific"
autocmd FileType go nnoremap <buffer> <F5> :GoCallers<CR>
autocmd FileType go nnoremap <buffer> <F6> :GoDef<CR>
autocmd FileType go nnoremap <buffer> <F7> :GoBuild<CR>
autocmd FileType go nnoremap <buffer> <F8> :GoRun<CR>
