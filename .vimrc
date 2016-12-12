" ========
" encoding
" ========
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs21e,ucs-2

" =========
" neobundle
" =========
if &compatible
  set nocompatible " Be iMproved
endif
set runtimepath+=~/src/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/src/dein')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('altercation/vim-colors-solarized')
call dein#add('croaker/mustang-vim')
call dein#add('nanotech/jellybeans.vim')
call dein#add('tomasr/molokai')
call dein#add('vim-scripts/javacomplete')
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
" call dein#add('alpaca-tc/alpaca_powertabline')
" call dein#add('Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'})
" call dein#add('Lokaltog/powerline-fontpatcher')
call dein#add('mattn/emmet-vim')
call dein#add('toyamarinyon/vim-swift')
call dein#add('wavded/vim-stylus')
call dein#add('kchmck/vim-coffee-script')
call dein#add('scrooloose/syntastic')
call dein#add('grep.vim')
call dein#add('yegappan/mru')
call dein#add('ajh17/Spacegray.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('majutsushi/tagbar')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('tpope/vim-surround')
call dein#add('https://github.com/kmnk/vim-unite-giti.git')
call dein#add('slim-template/vim-slim')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-fugitive')
call dein#add('fuenor/qfixgrep')
call dein#add('tpope/vim-rails')
call dein#add('yssl/QFEnter')
call dein#add('Chiel92/vim-autoformat')
call dein#add('szw/vim-tags')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('tpope/vim-dispatch')
call dein#add('thoughtbot/vim-rspec')
call dein#add('pangloss/vim-javascript')
call dein#add('digitaltoad/vim-pug')
call dein#add('tacroe/unite-mark')

call dein#end()

" ===== unite
let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
let g:unite_enable_start_insert=1
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)
call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)

" ===== add unite command
command! O call s:UniteOpen()
function! s:UniteOpen()
  Unite file_rec/git
endfunction

" ===== Emmet
let g:user_emmet_expandabbr_key = '<C-y><C-y>'
function NoticeEmmetShortcutKey()
  echo 'Emmet invocation key was remapped to <C-y><C-y>'
endfunction
inoremap <C-y>, :NoticeEmmetShortcutKey

" ===== javacomplete
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

" ===== neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal') " For conceal markers.
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

" ===== powerline
let g:Powerline_symbols = 'compatible'

" ===== vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
nnoremap <C-e> :VimFiler<CR>

" ===== vim-tags
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f tags -R . 2>/dev/null"
    let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
    set tags+=tags,Gemfile.lock.tags
  endif
endif

" ===== vim-rspec
let g:rspec_command = 'Dispatch bundle exec spring rspec {spec}'
" RSpec.vim mappings
map ,rt :call RunCurrentSpecFile()<CR>
map ,rs :call RunNearestSpec()<CR>
map ,rl :call RunLastSpec()<CR>
map ,ra :call RunAllSpecs()<CR>

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ==========================================================
" 高速化のためにシンタックスハイライトに生け贄になってもらう
" ==========================================================
" syntax off
syntax on

" =========
" operation
" =========
set clipboard+=unnamed
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set wildmenu
set showcmd
set list
set nowrap
set whichwrap=b,s,<,>,[,]

" ===== make visible end of line
set listchars=tab:>\ ,trail:･,extends:<

" ===== determine the min num of screen lines
set scrolloff=4
set sidescrolloff=8

" ===== cleverer auto indentation
set cindent

" ===== keep indent depending prev line
set autoindent

" ===== auto adjust indentation from state of prev line
set smartindent

" ===== enable to move from eol or bol to next line
set backspace=indent,eol,start
set timeoutlen=1000
set ttimeoutlen=0

" ===== enable to copy to system clipboard
set clipboard=unnamed,autoselect

" back to nopaste by leaving insert mode
autocmd InsertLeave * set nopaste

" ===== mouse
set mouse=a
set ttymouse=xterm2

" ===== zl => zL
noremap zl zL
noremap zh zH

" ===== 保存とか終了とかエイリアス張る
nnoremap zq :q!<CR>
nnoremap zp :q!<CR> " だいぶゴリ押しだがホームポジションが崩れないので設定してみる
nnoremap ww :w<CR>
nnoremap wq :wq<CR>

" ===== soft tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" ===== backup
set noswapfile " stop generating .swp file
set hidden " enable to open other file when buffer contains file isn't saved
set autoread " check automatically if the file has changed externally

" ===== search
set hlsearch
set incsearch
set ignorecase
set smartcase " if a pattern contains an uppercase the search will be case sensitive

" ===== パターン検索のエスケープを必要なくする
nnoremap / /\v

" ===== auto complete
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

" ===== quickfix
nnoremap <silent> [co :copen<CR>
nnoremap <silent> [cp :cprev<CR>
nnoremap <silent> [cn :cnext<CR>
nnoremap <silent> [cf :cfirst<CR>
nnoremap <silent> [cl :clast<CR>

" ===== tabs
nnoremap <silent> <C-n><C-n>  :<C-u>tabnew<CR>
nnoremap <silent> <C-n><C-c>  :<C-u>tabclose<CR>
nnoremap <silent> <C-n><C-o>  :<C-u>tabonly<CR>
nnoremap <silent> <C-n><C-j>  :<C-u>tabnext<CR>
nnoremap <silent> <C-n><C-k>  :<C-u>tabprevious<CR>

" =======
" display
" =======
set ambiwidth=double
set showmatch " emphasize matching parensis
set title
set number
augroup numberwidth " add left margin to line number
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END
set relativenumber
set ruler " the ruler is displayed on the right side of the status line
set cursorline
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
colorscheme default
highlight ZenkakuSpace cterm=underline ctermfg=lightblue
match ZenkakuSpace /　/

" ===== tmux title
if $TMUX != ""
  augroup titlesettings
    autocmd!
    " autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
    autocmd BufEnter * call system("tmux rename-window " . "' " . expand("%:t") . "'")
    autocmd VimLeave * call system("tmux rename-window zsh")
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
  augroup END
endif

" ===== AutoComplete parentheses, braces
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" ===== javaid?
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" highlight LineNr ctermfg=darkyellow
vnoremap <silent> p "0p<CR>

" ======
" indent
" ======
"
" ===== md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" ===== for Smarty
autocmd BufNewFile,BufRead *.tpl set noexpandtab

" ===== for HTML
autocmd BufNewFile,BufRead *.html set expandtab
autocmd BufNewFile,BufRead *.html set tabstop=2
autocmd BufNewFile,BufRead *.html set shiftwidth=2
autocmd BufNewFile,BufRead *.html set softtabstop=2

" ===== for CSS
autocmd BufNewFile,BufRead *.css set expandtab
autocmd BufNewFile,BufRead *.css set tabstop=2
autocmd BufNewFile,BufRead *.css set shiftwidth=2
autocmd BufNewFile,BufRead *.css set softtabstop=2

" ===== for Stylus
autocmd BufNewFile,BufRead *.styl set expandtab
autocmd BufNewFile,BufRead *.styl set tabstop=2
autocmd BufNewFile,BufRead *.styl set shiftwidth=2
autocmd BufNewFile,BufRead *.styl set softtabstop=2

" ===== for Ruby
autocmd BufNewFile,BufRead *.rb set expandtab
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2

" ===== for ERuby
autocmd BufNewFile,BufRead *.erb set expandtab
autocmd BufNewFile,BufRead *.erb set tabstop=2
autocmd BufNewFile,BufRead *.erb set shiftwidth=2
autocmd BufNewFile,BufRead *.erb set softtabstop=2

" ===== for Jade
autocmd BufNewFile,BufRead *.jade set expandtab
autocmd BufNewFile,BufRead *.jade set tabstop=2
autocmd BufNewFile,BufRead *.jade set shiftwidth=2
autocmd BufNewFile,BufRead *.jade set softtabstop=2

" ===== for JSON
autocmd BufNewFile,BufRead *.json set syntax=off
autocmd BufNewFile,BufRead *.json set expandtab
autocmd BufNewFile,BufRead *.json set tabstop=2
autocmd BufNewFile,BufRead *.json set shiftwidth=2
autocmd BufNewFile,BufRead *.json set softtabstop=2

" ===== for JavaScript
autocmd BufNewFile,BufRead *.js set expandtab
autocmd BufNewFile,BufRead *.js set tabstop=2
autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.js set softtabstop=2

" ===== for JSX
autocmd BufNewFile,BufRead *.jsx set expandtab
autocmd BufNewFile,BufRead *.jsx set tabstop=2
autocmd BufNewFile,BufRead *.jsx set shiftwidth=2
autocmd BufNewFile,BufRead *.jsx set softtabstop=2

" ===== for Yaml
autocmd BufNewFile,BufRead *.yml set expandtab
autocmd BufNewFile,BufRead *.yml set tabstop=2
autocmd BufNewFile,BufRead *.yml set shiftwidth=2
autocmd BufNewFile,BufRead *.yml set softtabstop=2

" ===== for CoffeeScript
autocmd BufNewFile,BufRead *.coffee set expandtab
autocmd BufNewFile,BufRead *.coffee set tabstop=2
autocmd BufNewFile,BufRead *.coffee set shiftwidth=2
autocmd BufNewFile,BufRead *.coffee set softtabstop=2

" ===== for Swift
autocmd BufNewFile,BufRead *.swift set expandtab
autocmd BufNewFile,BufRead *.swift set tabstop=4
autocmd BufNewFile,BufRead *.swift set shiftwidth=4
autocmd BufNewFile,BufRead *.swift set softtabstop=4

" ===== for .vimrc
autocmd BufNewFile,BufRead .vimrc set expandtab
autocmd BufNewFile,BufRead .vimrc set tabstop=2
autocmd BufNewFile,BufRead .vimrc set shiftwidth=2
autocmd BufNewFile,BufRead .vimrc set softtabstop=2

" ===== for .gitconfig
autocmd BufNewFile,BufRead .gitconfig set noexpandtab
autocmd BufNewFile,BufRead .gitconfig set tabstop=4
autocmd BufNewFile,BufRead .gitconfig set shiftwidth=4
autocmd BufNewFile,BufRead .gitconfig set softtabstop=4

"===========
" Command Shortcuts
"===========
nnoremap <silent> ,up  :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> ,ug  :<C-u>Unite file_rec/git<CR>
nnoremap <silent> ,uu  :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,gd  :<C-u>Gdiff<CR>
nnoremap <silent> ,gs  :<C-u>Gstatus<CR>
nnoremap <silent> ,gl  :<C-u>Glog<CR>
nnoremap <silent> ,gb  :<C-u>Gblame<CR>
nnoremap <silent> ,son :<C-u>syntax on<CR>
nnoremap <silent> ,sof :<C-u>syntax off<CR>
nnoremap <silent> ,rn :<C-u>set relativenumber<CR>
nnoremap <silent> ,e   :<C-u>VimFiler <CR>
nnoremap <silent> ,m   :<C-u>MRU <CR>
command E VimFiler
nnoremap <silent> <C-n><C-e> :VimFiler<CR>
command F echo expand('%:p')
nnoremap <silent> <C-n><C-f> :echo expand('%:p')<CR>
command M MRU
nnoremap <silent> <C-n><C-m> :MRU<CR>
command SP set paste
command SW set wrap
command HB call HtmlBeautify()
nnoremap <silent> <C-n><C-o><C-h> :noh<CR>

" ===== open VimFIler if no argument passed
" autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | VimFiler | endif
function! s:GetBufByte()
    let byte = line2byte(line('$') + 1)
    if byte == -1
        return 0
    else
        return byte - 1
    endif
endfunction

source ~/Codes/dotfiles/.vimrc-private

set background=light
