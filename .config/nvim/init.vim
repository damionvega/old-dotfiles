" ==============================================================================
" PLUGINS {{{
" ==============================================================================

call plug#begin('~/.config/nvim/plugs')

Plug 'airblade/vim-gitgutter'
Plug 'dag/vim-fish'
Plug 'damionvega/gruvbox'
" Plug 'ElmCast/elm-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/fountain.vim'

call plug#end()

" }}}
" ==============================================================================
" SETTINGS {{{
" ==============================================================================

" NeoVim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set t_Co=256

" Set syntax highlighting
set background=dark
syntax on

" Color scheme
let g:gruvbox_contrast_dark = 'soft'
colo gruvbox

" Change mapleader
let mapleader=','

" Copy register to clipboard
set clipboard+=unnamedplus

" Local dirs
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo

" ------------------------------------------------------------------------------
" Basic settings [[[
" ------------------------------------------------------------------------------
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces - github, other editor friendly
set foldcolumn=0 " Don't show column folds
set nofoldenable
set foldlevel=2
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set ignorecase " Ignore case of searches.
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters.
set smartindent
set tabstop=2
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file
silent !tmux set status on " Enable tmux status bar

" ]]]
" ------------------------------------------------------------------------------
" Tricks. You got to use TRICKS: https://www.youtube.com/watch?v=8VEfvuhGv9Q [[[
" ------------------------------------------------------------------------------

" Set relative line numbers
set rnu " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

" Load vimrc
nmap <leader>m :source $MYVIMRC<CR>

" Say goodbye to SHIFT-;
nnoremap ; :

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Clear last search (,<space>)
map <silent><leader><space> <Esc>:noh<CR>

" Jump to console for shell command
map <silent><leader>c <Esc>:! 

" Repeat last console command
map <silent><leader>11 <Esc>:!!<CR>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" Quick splits (,v) (,h)
map <leader>v :vsplit<CR>
map <leader>h :split<CR>

" Buffer switching (,,) (,z) (,x)
map <leader>, <C-^>
map <leader>x :bnext<CR>
map <leader>z :bprev<CR>

" Speed up viewport scrolling
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Faster split resizing (+,_)
if bufwinnr(1)
  map + <C-W>+
  map _ <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Better mark jumping (line + col)
nnoremap ' `

" Remap keys for auto-completion menu
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"

" Yank from cursor to end of line
nnoremap Y y$

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

" Toggle folds (<Space>)
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Make whitespace visible
set list listchars=tab:\ \ ,trail:·

" Give top and bottom padding while scrolling
set scrolloff=10

" Center focus
nnoremap n nzz
nnoremap N Nzz

" Go to end or beginning of line in insert mode (Ctrl-e, Ctrl-a)
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" Open current file in...
nnoremap <F12>s :exe ':silent !open -a /Applications/Safari.app %'<CR>
nnoremap <F12>m :exe ':silent !open -a /Applications/Mou.app %'<CR>;
nnoremap <F12>v :exe ':silent !open -a /Applications/MacVim.app %'<CR>;

" New line above
inoremap <C-O> <esc>O

" qq to record, Q to replay
nmap Q @q

" <tab>/<S-tab> | Circular buffer navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Never gets used, turn it off
set modelines=0

" Use normal regex
nnoremap / /\v
vnoremap / /\v

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Still trying to figure out this whole 'typing' thing
iabbr serach search
iabbr tiem item
iabbr usre user
iabbr piont point
iabbr iamges images
iabbr bdoy body

" Disable Shift-k
nnoremap <S-k> <Nop>

" Delete line while in insert mode
inoremap <C-d> <esc>ddi

" ]]]
" ==============================================================================
" Helpers [[[
" ==============================================================================

" Mark todo completed
function! ToggleComplete()
  let l:line = getline('.')

  " Get the char to test with the help of a pattern, ' ' or 'X':
  " \zs and \ze lets you retrieve only the part between themselves:
  let l:char = matchstr(l:line, '\[\zs.\ze]')

  if l:char == 'X'
    let l:char = ' '
  else
    let l:char = 'X'
  endif

  " Replace the current line with a new one, with the
  " correct char substituted:
  call setline(line('.'), substitute(l:line, '\[\zs.\ze]', l:char, ''))
endfunction
nnoremap <C-x> :call ToggleComplete()<CR>

" Strip trailing whitespace (,w)
function! StripWhitespace()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>w :call StripWhitespace()<CR>

" Strip semicolons (,e)
function! StripSemicolons()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  :%s/;//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>e :call StripSemicolons()<CR>

" Quick Pairs
function! CheckIfEscaped()
  let line = getline('.')[:col('.') - 2]
  if line[-1:] is# '\'
    return "'"
  elseif line[-1:]=~'\a' " Check for words like 'don't'
    return "'"
  else
    return "''\<Esc>\i"
  endif
endfunction

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' <C-R>=CheckIfEscaped()<CR>
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

" ]]]
"
" }}}
" ==============================================================================
" FILETYPES {{{
" ==============================================================================

" Markdown ---------------------------------------------------------------------
augroup filetype_markdown
  autocmd!
  " Keep cursor vertically in middle for writing & width of 80 chars
  au BufNewFile,BufReadPost *.md setlocal ft=markdown syntax=markdown so=999 tw=80
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END

" Screen -----------------------------------------------------------------------
augroup filetype_screen
  autocmd!
  " Keep cursor vertically in middle for writing & width of 80 chars. For some
  " reason, this does not work unless we set ft=markdown
  au BufNewFile,BufReadPost *.screen setlocal ft=markdown syntax=txt so=999 tw=60
augroup END

" Fish -------------------------------------------------------------------------
augroup filetype_fish
  autocmd!
  au BufRead,BufNewFile *.fish set ft=fish
augroup END


" }}}
" ==============================================================================
" PLUGIN CONFIG {{{
" ==============================================================================

" Commentary -------------------------------------------------------------------
augroup commentary_config
  autocmd!
  autocmd FileType jade setlocal commentstring=//\ %s
augroup END

" Dispatch ---------------------------------------------------------------------
augroup dispatch_config
  autocmd!
  " Prep command
  nnoremap <leader>s :Dispatch! 
augroup END

" EasyAlign --------------------------------------------------------------------
augroup easy_align_config
  autocmd!
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. <leader>aip)
  nmap <leader>aip <Plug>(EasyAlign)
augroup END

" Elm --------------------------------------------------------------------------
augroup elm
  autocmd!
  let g:elm_jump_to_error = 1
  let g:elm_make_output_file = "elm.js"
  let g:elm_make_show_warnings = 1
  let g:elm_detailed_complete = 1
  let g:elm_format_autosave = 0
  let g:elm_setup_keybindings = 0

  nnoremap <leader>ed :ElmShowDocs<CR>
  nnoremap <leader>et :ElmTest<CR>
  nnoremap <leader>em :ElmMake 
  nnoremap <leader>er :ElmRepl<CR>
augroup END

" Fugitive ---------------------------------------------------------------------
augroup fugitive_config
  autocmd!
  nnoremap <leader>ga :Git add %:p<CR><CR>
  nnoremap <leader>gaa :Git add .<CR><CR>
  nnoremap <leader>gst :Gstatus<CR>
  nnoremap <leader>gc :Gcommit -v -q<CR>
  nnoremap <leader>gt :Gcommit -v -q %:p<CR>
  nnoremap <leader>gd :Gvdiff<CR>
  nnoremap <leader>ge :Gedit<CR>
  nnoremap <leader>gr :Gread<CR>
  nnoremap <leader>gw :Gwrite<CR>
  nnoremap <leader>glg :silent! Glog<CR>:bot copen<CR>
  nnoremap <leader>gg :Ggrep<Space>
  nnoremap <leader>gm :Gmove<Space>
  nnoremap <leader>gbr :Git branch<Space>
  nnoremap <leader>gco :Git checkout<Space>
  nnoremap <leader>gbl :Gblame<Space>
  nnoremap <leader>gp :! git push<CR>
  nnoremap <leader>gl :! git pull<CR>
augroup END

" fzf --------------------------------------------------------------------------
augroup fzf_config
  autocmd!
  nmap <leader>t :FZF<CR>
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore node_modules -g ""'
augroup END

" Gitgutter --------------------------------------------------------------------
augroup gitgutter_config
  autocmd!
  let g:gitgutter_override_sign_column_highlight = 0
augroup END

" Goyo -------------------------------------------------------------------------
augroup goyo_config
  autocmd!

  nmap <leader>go :Goyo<CR>
  let g:goyo_width = 82

  function! s:goyo_enter()
    silent !tmux set status off
  endfunction

  function! s:goyo_leave()
    silent !tmux set status on
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" JSX --------------------------------------------------------------------------
augroup jsx_config
  autocmd!
  let g:jsx_ext_required = 0
augroup END

" Limelight --------------------------------------------------------------------
augroup limelight_config
  autocmd!
  nmap <leader>l :Limelight!!<CR>
  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240
  " Default: 0.5
  let g:limelight_default_coefficient = 0.9
  " Number of preceding/following paragraphs to include (default: 0)
  let g:limelight_paragraph_span = 1
augroup END

" Nerdtree ---------------------------------------------------------------------
augroup nerdtree_config
  autocmd!
  " Show project directory (,d) (,f)
  nnoremap <leader>d :NERDTreeToggle<CR>
  " Show current file when wandering directories
  nnoremap <leader>f :NERDTreeFind<CR>
  let NERDTreeMinimalUI = 1
  let NERDTreeShowHidden = 1
augroup END

" Obsession --------------------------------------------------------------------
augroup obsession_config
  autocmd!
  nnoremap <leader>o :Obsess<CR>
augroup END

" Polyglot ---------------------------------------------------------------------
augroup polyglot_config
  autocmd!
  " Blocks my theme's syntax
  let g:polyglot_disabled = ['markdown']
augroup END

" Silver Searcher --------------------------------------------------------------
augroup ag_config
  autocmd!
  if executable('ag')
    nmap <leader>ac :Ag 

    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
    " Have the silver searcher ignore all the same things as wilgignore
    let b:ag_command = 'ag %s -i --nocolor --nogroup'

    for i in split(&wildignore, ',')
      let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
      let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
    endfor

    let b:ag_command = b:ag_command . ' --hidden -g ""'
  endif
augroup END

" Syntastic --------------------------------------------------------------------
augroup syntastic_config
  autocmd!
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_javascript_checkers = ['eslint']
augroup END

" Ultisnips --------------------------------------------------------------------
augroup ultisnips_config
  autocmd!
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips']
  nmap <leader>ue :UltiSnipsEdit<CR>
augroup END

" Vim-plug ---------------------------------------------------------------------
augroup vimplug_config
  autocmd!
  " Install plugins
  nmap <leader>i :PlugInstall<CR>
augroup END

" }}}

