if has('python3')
endif
" Plugins
call plug#begin('~/.vim/plugged')
" === Colors
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
" === Misc
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/hexHighlight.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-eunuch'
Plug 'KabbAmine/vCoolor.vim'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/VisIncr'
Plug 'drwx/calutil.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/webapi-vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'machakann/vim-swap'
Plug 'terryma/vim-smooth-scroll'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/clever-f.vim'
Plug 'iggredible/totitle-vim'

" === IDE
Plug 'w0rp/ale'
"Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-projectionist'

" === Purescript
Plug 'raichoo/purescript-vim'
Plug 'frigoeu/psc-ide-vim'

" === CSS
Plug 'ap/vim-css-color'
Plug 'othree/csscomplete.vim'

" === Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-pug'

" === JSON
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'

" === Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alx741/vim-hindent'

" === Typescript
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
"Plug 'davidfriar/vim-tsx', { 'for': 'typescript.tsx' }
Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

" === LATEX
" Plug 'lervag/vimtex'

" === Python
Plug 'vim-python/python-syntax'

" === Scheme
Plug 'kovisoft/slimv'
Plug 'kien/rainbow_parentheses.vim'
Plug 'calebsmith/vim-lambdify'

" === Rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'
Plug 'racer-rust/vim-racer'
Plug 'pest-parser/pest.vim'
Plug 'cespare/vim-toml'

Plug 'beyondmarc/glsl.vim'

" === Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'beloglazov/vim-online-thesaurus'

" === Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jxnblk/vim-mdx-js'

" === Openscad
Plug 'sirtaj/vim-openscad'

call plug#end()

function! s:init_fern() abort
  nmap <buffer><expr>
          \ <Plug>(fern-my-open-expand-collapse)
          \ fern#smart#leaf(
          \   "\<Plug>(fern-action-open:select)",
          \   "\<Plug>(fern-action-expand)",
          \   "\<Plug>(fern-action-collapse)",
          \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  highlight FernGitStatusBracket guifg=bg
endfunction

let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
highlight default link FernBranchText   Directory

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END

let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1

let g:pymode_python = 'python3'
let g:python_highlight_all = 1

let g:gundo_prefer_python3 = 1

let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:user_emmet_mode='iv'
let g:user_emmet_leader_key=';'
let g:user_emmet_settings = { 'javascript.jsx' : {  'extends' : 'jsx', }, }

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_filetype_blacklist = { 'haskell': 1 }

let g:ale_enabled = 0 " start disabled to be more responsive and not interfere with Haskell -- find a better way to do this
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '●'
let g:ycm_error_symbol = '●'
let g:ycm_warning_symbol = '●'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslint', 'prettier'],
\   'typescript': [ 'prettier'],
\   'typescript.tsx': [ 'prettier'],
\   'css': ['prettier'],
\   'html': ['tidy'],
\   'python': [ 'add_blank_lines_for_python_control_statements', 'autopep8',
\     'black', 'isort', 'remove_trailing_lines', 'trim_whitespace', 'yapf']
\}
let g:ale_linters = {
  \ 'rust': ['rls'],
  \ 'haskell': ['stack-build', 'stack_ghc', 'hdevtools', 'hie', 'hlint']
  \}
let g:ale_rust_rls_toolchain ='stable'

let g:ale_set_balloons= 1

let g:ycm_enable_diagnostic_highlighting = 0

let g:pandoc#syntax#conceal#use =0
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

autocmd FileType json let g:vim_json_syntax_conceal = 0

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
let g:gruvbox_italic = 1
let g:gruvbox_sign_column='bg0'
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='fg'
let g:gruvbox_invert_selection=0
colorscheme gruvbox
let g:solarized_diffmode="high"
hi EndOfBuffer guifg=bg

"Tweaks for GruvBox
hi! link haskellType GruvboxYellow
hi! link haskellIdentifier GruvboxBlue
"
"
" Tweaks for solarized
" :exe 'hi SpecialKey guibg=NONE guifg=' g:terminal_ansi_colors[0]
" :exe 'hi Error guibg=' g:terminal_ansi_colors[0] 'guifg=' g:terminal_ansi_colors[1] 'gui=bold cterm=bold'
" :exe 'hi ALEError guibg=NONE guifg=' g:terminal_ansi_colors[1] 'gui=underline'
" :exe 'hi YcmErrorSign guibg=NONE guifg=' g:terminal_ansi_colors[1]
" :exe 'hi YcmErrorSection guibg=NONE guifg=' g:terminal_ansi_colors[1] 'gui=underline'
" set fillchars+=vert:│
" :exe 'hi VertSplit guifg=bg guibg=' g:terminal_ansi_colors[0]

let g:gitgutter_sign_priority = 9

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_solarized_bg='dark'
" let g:airline_solarized_normal_green = 1
let g:airline_solarized_dark_text = 1
let g:airline_solarized_dark_inactive_border = 1

au VimEnter * call matchadd('SpecialKey', '\s', -1)
au VimEnter * call matchadd('SpecialKey', '$', -1)
set cursorline
hi! link typescriptReserved Keyword
hi! link jsxCloseTag jsxTag
hi! link jsxCloseString jsxTag
hi! link xmlTag Operator
hi! link xmlEndTag Operator
hi! link tsxComponent Function
hi! link tsxIntrinsicElement Structure
hi! link embeddedTsStart Statement
hi! link embeddedTsEnd Statement
hi! link schemeParentheses Normal

set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¬


" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeQuitOnOpen = 1
" let NERDTreeHijackNetrw = 0
" let NERDTreeShowHidden=1

let g:filebeagle_show_hidden = 1

let mapleader=" "
let maplocalleader="\\"

map <leader>v :source ~/.vimrc<CR>
" map <leader>t :NERDTreeToggle<CR>
noremap <silent> <Leader>t :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=
nmap <leader>n :set relativenumber!<CR>
nmap <leader>N :set number!<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>b :ZBuffers<CR>
nmap <leader>f :ZFiles<CR>

"highlight last inserted text
nnoremap gV `[v`]

nnoremap <leader>u :GundoToggle<CR>

" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l



set nocompatible
set number
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
nnoremap <silent> <CR> :nohlsearch<CR><CR>
set showmatch
set laststatus=2
set timeoutlen=1000 ttimeoutlen=10
set incsearch
set noshowmode
noremap <F8> :Geeknote<cr>

set rtp+=/usr/local/opt/fzf

set mouse=a

set omnifunc=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
autocmd FileType less set omnifunc=csscomplete#CompleteCSS noci
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
let g:ycm_cache_omnifunc = 0

augroup File-Type
    autocmd!
    autocmd FileType qf setlocal wrap
    " ... Other autocmds if you like.
augroup END


autocmd FileType purescript :iabbrev <buffer> forall ∀


set diffopt+=vertical

let g:fzf_command_prefix = 'Z'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

set autoread
set encoding=utf-8


let g:vimtex_view_method='zathura'

" Open some binaries with external tools
autocmd BufReadCmd *.pdf silent !zathura % &
autocmd BufEnter *.pdf bdelete
autocmd BufReadCmd *.png silent !xdg-open % &
autocmd BufEnter *.png bdelete
autocmd BufReadCmd *.jpg silent !xdg-open % &
autocmd BufEnter *.jpg bdelete
autocmd BufReadCmd *.jpeg silent !xdg-open % &
autocmd BufEnter *.jpeg bdelete
autocmd BufReadCmd *.gif silent !xdg-open % &
autocmd BufEnter *.gif bdelete
autocmd BufReadCmd *.ico silent !xdg-open % &
autocmd BufEnter *.ico bdelete

set wildmenu


if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "", 0700)
endif
set undodir=~/.vim/undo//
set undofile
set directory=~/.vim/swap//

" Chicken Scheme
let g:is_chicken = 1
setl lispwords+=let-values,condition-case,with-input-from-string
setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setl lispwords+=call-with-output-file


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:rustfmt_autosave = 1


set spelllang=en_gb
set spellfile=~/.vim/spell/en.utf-8.add

function! s:goyo_enter()
  Limelight
  set noshowmode
  set noshowcmd
  set nolist
  set wrap
  set linebreak
  set noruler
  set laststatus=0
  set display+=lastline
  set spell
  hi StatusLine guifg=bg guibg=bg gui=NONE term=none cterm=NONE
  hi StatusLineNC guifg=bg guibg=bg gui=NONE term=none cterm=NONE
  hi TabLine guifg=bg guibg=bg gui=NONE term=none cterm=NONE
  nnoremap j gj
  nnoremap k gk
endfunction

function! s:goyo_leave()
  Limelight!
  set showmode
  set showcmd
  set nowrap
  set nolinebreak
  set list
  set nospell
  unmap j
  unmap k
  :exe 'hi SpecialKey guibg=NONE guifg=' g:terminal_ansi_colors[0]
  " highlight clear CursorLineNR
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0

omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>


" for Coc
set cmdheight=2
set updatetime=300
set shortmess+=c
" if has("patch-8.1.1564")
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
" need to change this so it doesn't mess up ycm...
inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Mappings using CoCList:
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


let g:hindent_line_length = 100

vnoremap <C-y> "+y
nnoremap <C-p> "+p


let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

autocmd FileType vifm set syntax=vim

