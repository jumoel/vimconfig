" vim: set ft=vim sw=2 ts=2 sts=2 :

" Install vim-plug if it isn't installed already
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Install the plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'mhartington/oceanic-next'

Plug 'junegunn/goyo.vim'

Plug 'pangloss/vim-javascript'
	" Syntax highlight flow
	let g:javascript_plugin_flow = 1
	" Funky characters for some js stuff
	let g:javascript_conceal_function				= "λ"
	let g:javascript_conceal_null						= "ø"
	let g:javascript_conceal_return					= "⇚"
	let g:javascript_conceal_undefined			= "¿"
	let g:javascript_conceal_NaN						= "ℕ"
	let g:javascript_conceal_arrow_function = "⇒"

Plug 'mxw/vim-jsx'
	" Allow JSX in .js files
	let g:jsx_ext_required = 0

Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-gitgutter'
	" always show git gutter
	let g:gitgutter_sign_column_always = 1

Plug 'tpope/vim-sensible'

Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
	" open the fuzzy finder with Cmd-P
	nnoremap <silent> <leader>p :GFiles<CR>

Plug 'vim-syntastic/syntastic'
	let g:syntastic_javascript_checkers = ['eslint', 'flow']
	let g:syntastic_javascript_eslint_exec = 'eslint_d'

call plug#end()

" set a theme
set background=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

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
