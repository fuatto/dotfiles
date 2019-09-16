set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')

Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dogfooter/FIP.vim'
Plug 'buoto/gotests-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
"Plug 'wincent/ferret'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kburdett/vim-nuuid'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Use release branch
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'chrisbra/NrrwRgn'
" Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
" https://github.com/tpope/vim-markdown
Plug 'mattn/emmet-vim'
" https://github.com/mattn/emmet-vim
" Plug 'Yggdroot/indentLine'
Plug 'roman/golden-ratio'

call plug#end()

" Some common settings
set mouse=a
set number
set showcmd
set splitright
set splitbelow
set nowrap        						" don't wrap lines
set tabstop=4     						" a tab is four spaces
set backspace=indent,eol,start 			" allow backspacing over everything in insert mode
set autoindent    						" always set autoindenting on
set copyindent    						" copy the previous indentation on autoindenting
set number        						" always show line numbers
set shiftwidth=4  						" number of spaces to use for autoindenting
set shiftround    						" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     						" set show matching parenthesis
set ignorecase    						" ignore case when searching
set smartcase     						" ignore case if search pattern is all lowercase,
                  						" 	case-sensitive otherwise
set smarttab      						" insert tabs on the start of a line according to
                  						" 	shiftwidth, not tabstop
" set hlsearch      						" highlight search terms
set incsearch     						" show search matches as you type
set title                				" change the terminal's title
"set visualbell           				" don't beep
"set noerrorbells         				" don't beep
set nobackup
set noswapfile
set tw=80
set foldmethod=indent 					"config code folding by indent by default
set termguicolors

" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

colorscheme OceanicNext

" General colors for vim
" if has('gui_running') || has('vim')
"     hi Normal 		guifg=#f6f3e8 guibg=#242424
" else
"     " Set the terminal default background and foreground colors, thereby
"     " improving performance by not needing to set these colors on empty cells.
"     "hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
"     let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#282828\007"
"     let &t_te = &t_te . "\033]110\007\033]111\007"
" endif



" Leader
let mapleader = ","

" map keys for git
nnoremap <silent>gb :Gblame<CR>

" map keys for fzf
nnoremap ; :
nnoremap <space>bb :Buffers<CR>
nnoremap <space>bn :bn<CR>
nnoremap <space>bd :bd<CR>
nnoremap <space>bp :bp<CR>
nnoremap <space>pf :Files<CR>
nnoremap <space>sf :BLines<CR>
nnoremap <space>sp :Rg<CR>
nnoremap <space>qq :q<CR>
nnoremap <space>q! :q!<CR>
nnoremap <space>qa! :qa!<CR>

" map delete texts
nnoremap <silent>da :%d<CR>

" map removing hightlight in nohlsearch
nnoremap <silent><ESC><ESC> :nohl<CR>

" map keys for ranger
nnoremap <space>ar :Ranger<CR>

" map for nerdtree
nnoremap <silent><F8> :NERDTreeToggle<CR>

" map common keys
" save the current file
nnoremap <space>fs :w<CR>

" get theme
nmap <space>ts :Colors<CR>

" map for vim-easymotion
" <leader>f{char} to move to {char}
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Ignore git ignore when search
let $FZF_DEFAULT_COMMAND = 'rg -l ""'
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ranger settings
" ranger shows hidden files
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:ranger_map_keys = 0
" map keys
map <leader>ff :Ranger<CR>

" force coc to update
let g:coc_node_path = '/usr/local/bin/node'
" make sure coc uses compiled code
let g:coc_force_debug = 1

" indentLine config
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Golang settings
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_term_enabled = 1
" tell vim-go to not map gd as its shortcut for go to definition.
let g:go_def_mapping_enabled = 0

" protobuf config for syntax highlighting and config files to properly display Protocol Buffer files
if version < 600  
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn case match  
syn keyword pbTodo       contained TODO FIXME XXX
syn cluster pbCommentGrp contains=pbTodo 
syn keyword pbSyntax     syntax import option
syn keyword pbStructure  package message group oneof
syn keyword pbRepeat     optional required repeated
syn keyword pbDefault    default
syn keyword pbExtend     extend extensions to max reserved
syn keyword pbRPC        service rpc returns 

syn keyword pbType      int32 int64 uint32 uint64 sint32 sint64
syn keyword pbType      fixed32 fixed64 sfixed32 sfixed64
syn keyword pbType      float double bool string bytes
syn keyword pbTypedef   enum
syn keyword pbBool      true false

syn match   pbInt     /-\?\<\d\+\>/
syn match   pbInt     /\<0[xX]\x+\>/
syn match   pbFloat   /\<-\?\d*\(\.\d*\)\?/
syn region  pbComment start="\/\*" end="\*\/" contains=@pbCommentGrp
syn region  pbComment start="//" skip="\\$" end="$" keepend contains=@pbCommentGrp
syn region  pbString  start=/"/ skip=/\\./ end=/"/
syn region  pbString  start=/'/ skip=/\\./ end=/'/ 

if version >= 508 || !exists("did_proto_syn_inits")
	if version < 508
		let did_proto_syn_inits = 10
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink pbTodo         Todo

	HiLink pbSyntax       Include
	HiLink pbStructure    Structure
	HiLink pbRepeat       Repeat
	HiLink pbDefault      Keyword
	HiLink pbExtend       Keyword
	HiLink pbRPC          Keyword
	HiLink pbType         Type
	HiLink pbTypedef      Typedef
	HiLink pbBool         Boolean

	HiLink pbInt          Number
	HiLink pbFloat        Float
	HiLink pbComment      Comment
	HiLink pbString       String

	delcommand HiLink
endif
let b:current_syntax = "proto"


" default JSX syntax highlighting and indenting will be enabled for .js and jsx.
" Only for .jsx:
let g:jsx_ext_required = 1
" Disable concealing feature of Vim 7.3+
let g:vim_json_syntax_conceal = 0

" vim-css3-syntax config for highlighting problem on: vertical-align,
" box-shadow and ...
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" prettier config
autocmd FileType javascript set formatprg=prettier\ --stdin
" format on save
autocmd BufWritePre *.js :normal gggqG


" ale settings
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['prettier'],
\ 	'go': ['gopls'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'scss': ['prettier'],
\ 'css': ['prettier']
\}
let g:ale_fix_on_save = 1
" Error and warning signs.
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight Normal ctermbg=NONE

" Airline config: Enable integration with airline. 
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_oceanicnext'

" NERDCommenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" deoplete config
if has('nvim')
	" Enable deoplete on startup
	let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
	let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
	let b:deoplete_disable_auto_complete = 0
endfunction

" COCVIM SETTINGS 
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

set cot+=preview

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? coc#_select_confirm() :
	  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
	
	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	
	let g:coc_snippet_next = '<tab>'

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Custom settings
" Using coc-snippets
imap <C-j> <C-n>
imap <C-k> <C-p>

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
