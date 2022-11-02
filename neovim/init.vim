call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Latex
Plug 'lervag/vimtex'

" Color scheme and icons
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

" Lazygit integration
Plug 'kdheepak/lazygit.nvim'

" Initialize plugin system
call plug#end()

" NvimTree
lua << ENDLUA
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1
  
  require("nvim-tree").setup({
    open_on_setup = true,
    view = {
    },
    filters = {
      dotfiles = true,
    },
    git = {
      ignore = false,
    },
    renderer = {
      highlight_git = true,
      icons = {
        git_placement = "after"
      },
    },
  })
ENDLUA

" toggle nvimtree with keyboard
tnoremap <A-f> :NvimTreeToggle<CR>
nnoremap <A-f> :NvimTreeToggle<CR>

" VIMTEX CONF---------------------
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable
" --------------------------------

" Theme
let g:gruvbox_baby_background_color = "dark"
colorscheme gruvbox-baby

" LazyGit configuration
let g:lazygit_floating_window_winblend = 0                            " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9                    " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯']     " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0                         " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1                                   " fallback to 0 if neovim-remote is not installed
nnoremap <leader>gg :LazyGit<CR> 

" use alt+wasd to move between split/vsplit panels
tnoremap <A-a> <C-\><C-n><C-w>h
tnoremap <A-s> <C-\><C-n><C-w>j
tnoremap <A-w> <C-\><C-n><C-w>k
tnoremap <A-d> <C-\><C-n><C-w>l
nnoremap <A-a> <C-w>h
nnoremap <A-s> <C-w>j
nnoremap <A-w> <C-w>k
nnoremap <A-d> <C-w>l

" better terminal
tnoremap <A-t> :split<CR><C-w>j:terminal<CR>:res -5<CR>i
nnoremap <A-t> :split<CR><C-w>j:terminal<CR>:res -5<CR>i
tnoremap <ESC> <C-\><C-n>
nnoremap <ESC> <C-\><C-n>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Custom tab commands
nnoremap <A-q> :tabprevious<CR>
tnoremap <A-q> :tabprevious<CR>
nnoremap <A-e> :tabNext<CR>
tnoremap <A-e> :tabNext<CR>
nnoremap <A-n> :tabnew<CR>
tnoremap <A-n> :tabnew<CR>

" No line wrapping
set nowrap

" Spaces, not tabs, and width = 2
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Coc fix to select suggestions with enter
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" spell checker toggle
nnoremap <F1> :set spell!<CR>
inoremap <F1> <C-O>:set spell!<CR>

" relative line numbers
set number
set relativenumber

" no mouse
set mouse=
