set nocompatible
filetype off
" 此处规定Vundle的路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" original repos on github<br>Bundle 'mattn/zencoding-vim'
Plugin 'drmingdrmer/xptemplate'
"
"" vim-scripts repos
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'bufexplorer.zip'
Plugin 'taglist.vim'
Plugin 'Mark'
Plugin 'The-NERD-tree'
Plugin 'matrix.vim'
Plugin 'closetag.vim'
Plugin 'The-NERD-Commenter'
Plugin 'matchit.zip'
Plugin 'AutoComplPop'
Plugin 'jsbeautify'
Plugin 'YankRing.vim'
"Plugin 'Lokaltog/powerline'
" Plugin 'powerline/powerline'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'WolfgangMehner/vim-plugins'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
"Plugin 'msanders/snipmate.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'honza/vim-snippets'
" Plugin 'bling/vim-airline'
"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-scripts/winmanager'
Plugin 'mileszs/ack.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'derekwyatt/vim-scala'
Plugin 'flazz/vim-colorschemes'
"Plugin 'python-rope/ropevim'
Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json'
"Plugin 'Shougo/vimproc.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-scripts/awk-support.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
"Plugin 'Chiel92/vim-autoformat'
"
"Plugin 'maksimr/vim-jsbeautify'
call vundle#end()

filetype plugin indent on     " required!

"color desertEx
color atom
"colorschemes Atom
"set guifont=Yahei\ Consolas\ Hybrid\ 14
"set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gb2312,gbk

"解决中文菜单乱码
"set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决console输出乱码
"language messages zh_cn.utf-8

set nocompatible
syntax on
set autoindent
set hlsearch

set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white
set cmdheight=2

let g:ctrlp_map = '<c-p>'

set number
" C++的编译和运行
map <C-F5> :call CompileRunGpp()<CR>
func! CompileRunGpp()
  exec "w"
  exec "!g++ -Wall -g -O3 -std=c++11 % -o %<"
  exec "! %<"
endfunc

map <C-F7> :!python % <CR>
set tabstop=4
autocmd BufEnter * silent! lcd %:p:h
set sw=4
set ts=4

filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4
set hlsearch
set incsearch
map rj :RopeGotoDefinition<CR>
map rr :RopeRename<CR>

function! AutoLoadCTagsAndCScope()
    let max = 5
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out')
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
map <C-A> :NERDTree ./ <CR>
set so=5
"supertab与snipmate的tab键冲突解决方案
let SuperTabMappingForward="<tab>"
let SuperTabMappingBackward="<s-tab>"
let g:SuperTabDefaultCompletionType="context"
map <C-F2> :execute '%s#\| \([^\|]*\) \| [^\|]* \| \| \| #\1,#g\|%j' <CR>
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
map <C-c> "+y
let mapleader=','
map <leader>t :NERDTreeToggle <CR>
autocmd BufRead *.py map <leader>go :RopeGotoDefinition <CR>
let ropevim_vim_completion=1
set tags=/usr/include/tags

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
"autocmd BufWritePost .vimrc source %
nmap <F8> :TagbarToggle<CR>
let g:airline#extensions#tabline#enable = 1
set cursorcolumn
set cursorline

set exrc
set secure
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

map <c-i> :!./% <CR>
function! DeleteSpace()
    let save_cursor = getpos(".")
    %s#[  ]*$##g
    call setpos(".", save_cursor)
endfunction
autocmd BufWritePre * call DeleteSpace()

function! InsertHeader()
    call setline(".", "# coding=utf-8")
endfunction

autocmd BufNewFile *.py call InsertHeader()
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"
map <F12> :bn <CR>
