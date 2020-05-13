if !exists('g:vscode')
		colorscheme codedark
		syntax enable           " enable syntax processing
		set tabstop=4			" set visual tabs
		set cursorline 			" highlight current line
		set wildmenu 			" visual autocomplete for command menu
		set showmatch 			" highlight matching [{()}] highlights matching bracket
		set hlsearch			" highlights search results
		set ruler               " shows line number and column number

		" vim plug
		call plug#begin('~/.config/nvim/plugged')

		"plugin section

		"prettier setup
		Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
		let g:prettier#autoformat = 0
		autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
		" prettier on save
		command! -nargs=0 Prettier :CocCommand prettier.formatFile

		" including coc pluggins
		let g:coc_global_extensions = [
		  \ 'coc-snippets',
		  \ 'coc-pairs',
		  \ 'coc-tsserver',
		  \ 'coc-eslint', 
		  \ 'coc-prettier',
		  \ 'coc-css',
		  \ 'coc-json', 
		  \ ]

		"nerd tree setup
		Plug 'preservim/nerdtree'
		nmap <C-h> <C-w>h
		nmap<C-l> <C-w>l

		nmap <C-f> :NERDTreeToggle<CR>
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "if nerdTree is the last window, it auto closes"

		"Vim Airline Setup
		Plug 'vim-airline/vim-airline'
		let g:airline_theme = 'codedark'


		"intellisense with cocVIM
		Plug 'neoclide/coc.nvim', {'branch': 'release'}

		" TextEdit might fail if hidden is not set.
		set hidden

		"Some servers have issues with backup files, see #649.
		set nobackup
		set nowritebackup

		" Give more space for displaying messages.
		set cmdheight=2

		" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
		" delays and poor user experience.
		set updatetime=300

		" Don't pass messages to |ins-completion-menu|.
		set shortmess+=c

		" Always show the signcolumn, otherwise it would shift the text each time
		" diagnostics appear/become resolved.
		set signcolumn=yes

		" Use tab for trigger completion with characters ahead and navigate.
		" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
		" other plugin before putting this into your config.
		inoremap <silent><expr> <TAB>
			  \ pumvisible() ? "\<C-n>" :
			  \ <SID>check_back_space() ? "\<TAB>" :
			  \ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

		function! s:check_back_space() abort
		  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

		" Use <c-space> to trigger completion.
		inoremap <silent><expr> <c-space> coc#refresh()

		" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
		" position. Coc only does snippet and additional edit on confirm.
		" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
		if exists('*complete_info')
		  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
		else
		  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		endif

		" Use `[g` and `]g` to navigate diagnostics
		nmap <silent> [g <Plug>(coc-diagnostic-prev)
		nmap <silent> ]g <Plug>(coc-diagnostic-next)

		"end plugin section
		call plug#end()


		"NerdTree fonts and icons
		Plug 'ryanoasis/vim-devicons'
		set encoding=utf-8
else
		"vs-code vim settings"
endif
