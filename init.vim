" Install vim-plug if it isn't installed already
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif          
                                                                                                                      
" Install the plugins 
call plug#begin('~/.config/nvim/plugged')
Plug 'mhartington/oceanic-next' 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'vim-syntastic/syntastic'
call plug#end()

" vim shouldn't rename original files when writing new ones
" because it can break hot reloading and file watching
set backupcopy=yes

" use true colors
set termguicolors

" show line numbers
set number

" set a theme
set background=dark
colorscheme OceanicNext

" use smaller tabsizes
set tabstop=4

" don't display netrw top banner 
let g:netrw_banner=0

" always show git gutter
let g:gitgutter_sign_column_always = 1

" Allow JSX in .js files
let g:jsx_ext_required = 0

" Syntax highlight flow
let g:javascript_plugin_flow = 1

" Funky characters for some js stuff
let g:javascript_conceal_function       = "λ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_arrow_function = "⇒"

" use eslint for js files
let g:syntastic_javascript_checkers = ['eslint']
