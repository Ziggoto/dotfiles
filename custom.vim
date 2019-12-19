"*****************************************************************************
"" My (Fábio Theophilo) custom modifications
"*****************************************************************************
Plug 'posva/vim-vue'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdcommenter'
Plug 'lfilho/cosco.vim'
Plug 'junegunn/gv.vim'

" My custom modifications
set foldmethod=indent
set foldlevel=20
set autoread
set mouse=a
set cursorline

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

let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

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

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

autocmd FileType javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

autocmd FileType cucumber setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
