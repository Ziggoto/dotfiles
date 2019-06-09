"*****************************************************************************
"" My (Fábio Theophilo) custom modifications
"*****************************************************************************
Plug 'posva/vim-vue'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdcommenter'

set foldmethod=indent
set foldlevel=20
set autoread
set mouse=a

" Syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'

hi Normal guibg=NONE ctermbg=NONE

let NERDSpaceDelims=1

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

autocmd FileType vue syntax sync fromstart
autocmd FileType vue setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2

noremap <Leader>gu :GitGutterUndoHunk<CR>
