" vim: set ft=vim sw=2 ts=2 sts=2 :

" Install the plugins
call plug#begin('~/.config/nvim/plugged')
  " Fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" LSP & completion
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'

	" Writing mode
	Plug 'junegunn/goyo.vim'

	" Color
	Plug 'fenetikm/falcon'

	" Syntaxes
	Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

lua << EOF
local nvim_lsp = require('lspconfig')
 
-- enabled lsp servers
local servers = { "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" open the fuzzy finder with Cmd-P
nnoremap <silent> <leader>p :FilesPreview<CR>
nnoremap <silent> <leader>b :Buffers<CR>
command! -bang -nargs=? -complete=dir FilesPreview
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" set a theme
set background=dark
colorscheme falcon

syntax on

" ensure the gutter is always shown
set signcolumn=yes

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
" make the listchars barely visible
highlight NonText guifg=#444444

" enable mouse
set mouse=a

autocmd BufEnter * lua require'completion'.on_attach()
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()

