" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

" Sections:
"    -> Plugins
"    -> Plugin Settings
"	 	-> MATCHIT
"	 	-> "JULIA FORMATTER
"	 	-> MARKDOWN-PREVIEW
"	 	-> AIRLINE
"	 	-> VIM-EMOJI
"	 	-> VIMPENCIL
"	 	-> GRUVBOX
"	 	-> TABULAR & VIM-MARKDOWN
"	 	-> VIM-PANDOC
"	 	-> VIM-SLIME
"	 	-> FZF-VIM
"	 	-> VIM-TEX
"	 	-> VIM-LATEX-LIVE-PREVIEW
"    -> KEY REMAPS
"    -> General

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" ENABLES PLUGINS TO WORK
filetype plugin on

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" Git wrapper for Vim
	Plug 'tpope/vim-fugitive'

" Preview markdown on your modern browser with synchronised scrolling and flexible configuration.
"	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Automatic Window Resizing
	Plug 'camspiers/lens.vim'

" Formatting Julia Files
	Plug 'kdheepak/JuliaFormatter.vim'

" Adding support for LaTeX
	Plug 'lervag/vimtex'

" Live Previewing of LaTeX Documents
	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Moving through Vim easily
	Plug 'easymotion/vim-easymotion'

" Emoji support
	Plug 'fszymanski/deoplete-emoji'

" Easy commenting for Vim
	Plug 'preservim/nerdcommenter'

" Gruvbox color theme for Vim 
	Plug 'morhetz/gruvbox'

" Sends text to a target for execution
	Plug 'jpalardy/vim-slime'

" Easily manipulate bracket and quotations surround text
	Plug 'tpope/vim-surround'

" BibTeX Handling
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax' "Also used for Markdown formatting

" VIM Table Mode for instant table creation.
	Plug 'dhruvasagar/vim-table-mode'

" Deoplete Completion framework
	if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
	  Plug 'Shougo/deoplete.nvim'
	  Plug 'roxma/nvim-yarp'
	  Plug 'roxma/vim-hug-neovim-rpc'
	endif

" Tab naming powers
	Plug 'gcmt/taboo.vim'

" Multiple cursors for editing
	Plug 'mg979/vim-visual-multi'

" Adds file type icons to Vim plugins
	Plug 'ryanoasis/vim-devicons'

" The NERDTree is a file system explorer for the Vim editor
	Plug 'preservim/nerdtree'

" Vim session saving
	Plug 'tpope/vim-obsession'

" colorscheme
	Plug 'ParamagicDev/vim-medic_chalk'

" natural keybindings package
	Plug 'tpope/vim-unimpaired'

" an IDE for julia in vim
	Plug 'JuliaEditorSupport/julia-vim' 

" for markdown purposes - unsure if it works/ or is useful
	Plug 'godlygeek/tabular'

" a plugin for allowing a REPL like screen to be open alongside your coding buffer, it uses tmux, and could be setup to have an atom REPL like feel
"	Plug ' ervandew/screen'
" This is also for markdown, it is the de facto plugin for markdow  by the
" looks of things
	Plug 'plasticboy/vim-markdown'
" This is a plugin that gives extra functionality to the % command, i.e we can
" use the % key to move from open brakets to closed brackets AND move from if
" statements to the end, while statement, function blocks etc
	Plug 'tmhedberg/matchit'

" Command line fuzzy finder
	Plug 'junegunn/fzf', { 'do': './install --bin' } "Checks latest fzf binary
	Plug 'junegunn/fzf.vim'

" This plugin allows for distraction free environment for writing,
" specifically added for markdown purposes
	Plug 'junegunn/goyo.vim'

" Makes writing in markdown nicer apparently.
	Plug 'reedes/vim-pencil'


" Lean & mean status/tabline for vim that's light as air
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes' "Installs themes for airline

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MATCHIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This allows the matchit plugin to work
runtime macros/matchit.vim

"""""""""""""""""""""
"JULIA FORMATTER
"""""""""""""""""""""

let g:JuliaFormatter_options = {
		\  "move_n" : ",j",
		\  "move_N" : ",J",
		\  "move_p" : "Ctrl,j",
		\  "move_P" : "Ctrl,J",
		\  "moveblock_n" : "]]",
		\  "moveblock_N" : "][",
		\  "moveblock_p" : "[[",
		\  "moveblock_P" : "[]",
		\  "select_a" : "aj",
		\  "select_i" : "ij",
		\  "whereami" : "",
        \ 'indent'                    : 4,
        \ 'margin'                    : 92,
        \ 'always_for_in'             : v:false,
        \ 'whitespace_typedefs'       : v:false,
        \ 'whitespace_ops_in_indices' : v:true,
        \ }

"""""""""""""""""
"MARKDOWN-PREVIEW
"""""""""""""""""

" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

let g:mkdp_browser = 'vivaldi'

"""""""""""""""""""""
" AIRLINE
"""""""""""""""""""""

" Enabling Powerline symbols
let g:airline_powerline_fonts = 1

" Allows word counting in the following filetypes
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|pandoc|org|rst|tex|text'

" Shows all buffers when only one tab open
let g:airline#extensions#tabline#enabled = 0

" Handles file path displays
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Sets theme for airline
let g:airline_theme='gruvbox'


""""""""""""""""""""""""""""""
" VIM-EMOJI
""""""""""""""""""""""""""""""
set completefunc=emoji#complete

""""""""""""""""""""""""""""""
" VIMPENCIL
""""""""""""""""""""""""""""""

" Automatically enable Pencil for files
augroup pencil
  autocmd!
  autocmd FileType py call pencil#init({'wrap' : 'soft'})
  autocmd FileType markdown call pencil#init({'wrap' : 'soft'})
  autocmd FileType julia call pencil#init({'wrap' : 'soft'})
  autocmd FileType tex call pencil#init({'wrap' : 'soft'})
augroup END

""""""""""""""""""""""""""""""
" GRUVBOX
""""""""""""""""""""""""""""""
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark " Setting dark mode

""""""""""""""""""""""""""""""
" TABULAR & VIM-MARKDOWN
""""""""""""""""""""""""""""""

let g:vim_markdown_folding_level = 1

""""""""""""""""""""""""""""""
" VIM-PANDOC
""""""""""""""""""""""""""""""
let g:pandoc#filetypes#handled = ['pandoc', 'markdown'] 
let g:pandoc#modules#disabled = ['spell']
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#biblio#bibs = ['/home/src/Knowledgebase/Zettelkasten/zettel.bib']
let g:pandoc#toc#close_after_navigating = 0
let g:pandoc#toc#position = 'bottom' 
let g:pandoc#folding#fdc = 0

""""""""""""""""""""""""""""""
" VIM-SLIME
""""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

""""""""""""""""""""""""""""""
" FZF-VIM
""""""""""""""""""""""""""""""

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

""""""""""""""""""""""""""""""
" VIM-TEX
""""""""""""""""""""""""""""""

let g:tex_flavor='latexmk'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_mode=0
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
           \ 'preamble' : {'enabled' : 1},
           \ 'sections' : {'enabled' : 0},
           \ 'envs' : {
           \   'blacklist' : ['figures'],
           \ },
           \}


""""""""""""""""""""""""""""""
" VIM-LATEX-LIVE-PREVIEW
""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                  " VIM FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" code/string searching tool for multifile exploration
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': ':r !echo',
  \ }

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                 " KEY REMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Enables Tab completion for selecting from Deoplete omnicompletion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enables ripgrep for file completion via fzf
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Maps easymotion jumps for lines
map <leader><space>l <Plug>(easymotion-bd-jk)
nmap <leader><space>l <Plug>(easymotion-overwin-line)

" Maps easymotion jumps for words
map  <leader><Space>w <Plug>(easymotion-bd-w)
nmap <leader><Space>w <Plug>(easymotion-overwin-w)

" Automatic formatting for Julia files
nnoremap <buffer>  <c-f> :JuliaFormatterFormat<cr>

" Maps quit
noremap <leader>q :q<cr>

" Maps quit all
noremap <c-q> :qa<cr>

" Maps write
 nnoremap <leader>w :w<cr>

" Maps ripgrep file searching function
nnoremap <C-s> :Rg<Cr>

" Maps display of current buffers
nnoremap <C-b> :Buffers<Cr>

" Deselects currently highlighted searches
nnoremap <Leader><BS> :noh<cr>

" Activates Twiddle case to switch between cases of selected text
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-M> <C-W>M

" Map Ctrl + . to line finder in buffers
nnoremap <leader>. :Lines<cr>

" Map Ctrl + G to goyo
nnoremap <C-G> :Goyo<CR>

" Fast init file reload
nnoremap <leader>r :so ~/.vimrc<CR>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" search for words forwards and backwards respectively
map <space> /
map <leader><space> ?

" next and previous buffer respectively
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

set nocompatible

set encoding=utf-8

" Disable the default Vim startup message.
set shortmess+=I

" Add a last whitespace to the end of each line in vim. You can use g$
set ve+=onemore

" Show line numbers.
set number

" Show file stats
set ruler

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=2

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" sets :grep to the more advanced ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" set wrap 						 Wrap lines
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows


" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
" set ignorecase
set smartcase

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Turn on syntax highlighting.
syntax on

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" set auto-indenting on for programming
set ai         

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

"Displays incomplete commands
" set showcmd

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
" set hidden
