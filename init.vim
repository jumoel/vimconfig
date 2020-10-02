" vim: set ft=vim sw=2 ts=2 sts=2 :

" Install the plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'pbrisbin/vim-colors-off'
	Plug 'neovim/nvim-lspconfig'
call plug#end()

lua require'nvim_lsp'.rust_analyzer.setup{}

" open the fuzzy finder with Cmd-P
nnoremap <silent> <leader>p :GFiles<CR>

" set a theme
set background=dark
colorscheme off
syntax on

" vim shouldn't rename original files when writing new ones
" because it can break hot reloading and file watching
set backupcopy=yes

" use visual highlight of search results and escape from
" them with <Esc>
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" show matching parenthesis
set showmatch

" use true colors
set termguicolors

" show line numbers
set number

" use smaller tabsizes
set tabstop=2

" don't display netrw top banner
let g:netrw_banner=0
" Don't show gitignored files in explorer
let g:netrw_list_hide=
	\ netrw_gitignore#Hide() .
	\ ',^\.\.\=/\=$' .
	\ ',^\.git\/$'

" Show whitespace
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" make the listchars barely visible (when using oceanic-next)
highlight SpecialKey guifg=#263d4a

function! <SID>StripTrailingWhitespaces()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
endfunction

autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
