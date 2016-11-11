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
call plug#end()

" use true colors
set termguicolors

" syntax based on filenames
filetype on

" enable syntax highlighting
syntax on

" set a theme
colorscheme OceanicNext

" don't display netrw top banner 
let g:netrw_banner=0

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
