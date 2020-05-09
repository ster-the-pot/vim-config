colorscheme codedark
syntax enable           " enable syntax processing
set tabstop=4			" set visual tabs
set cursorline 			" highlight current line
set wildmenu 			" visual autocomplete for command menu
set showmatch 			" highlight matching [{()}] highlights matching bracket
set hlsearch			" highlights search results
set ruler               " shows line number and column number

" vim plug
call plug#begin('~/.vim/plugged')

"plugin section

"react section
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
"prettier setup
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"intellisense see plugin 
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"syntax checking
Plug 'dense-analysis/ale'

let g:ale_linters = {
						\   'javascript': ['eslint'],
						\   'typescript': ['tsserver', 'tslint'],
						\   'vue': ['eslint']
						\}
let g:ale_fixers = {
						\    'javascript': ['eslint'],
						\    'typescript': ['prettier'],
						\    'vue': ['eslint'],
						\    'scss': ['prettier'],
						\    'html': ['prettier']
						\}
let g:ale_fix_on_save = 1

"end plugin section
call plug#end()
