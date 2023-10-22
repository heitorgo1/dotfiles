set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'w0rp/ale'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-obsession'
Plugin 'fatih/vim-go'
Plugin 'google/vim-jsonnet'
Plugin 'psliwka/vim-smoothie'
Plugin 'Rykka/InstantRst'
Plugin 'Rykka/riv.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'othree/yajs.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-test/vim-test'
Plugin 'preservim/vimux'
Plugin 'jparise/vim-graphql'
Plugin 'hashivim/vim-terraform'
Plugin 'puremourning/vimspector'
Plugin 'sagi-z/vimspectorpy'
Plugin 'Shougo/echodoc.vim'
Plugin 'sindrets/diffview.nvim'
Plugin 'tpope/vim-repeat'
Plugin 'ggandor/leap.nvim'
if !has('nvim')
    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'skywind3000/asyncrun.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'tpope/vim-dispatch'
    Plugin 'honza/vim-snippets'
    Plugin 'tpope/vim-surround'
    Plugin 'Raimondi/delimitMate'
    Plugin 'neoclide/coc.nvim'
    Plugin 'henrybarreto/coc-redocly'
else
    Plugin 'nvim-lualine/lualine.nvim'
    Plugin 'nvim-tree/nvim-tree.lua'
    Plugin 'nvim-tree/nvim-web-devicons'
    Plugin 'nvim-lua/plenary.nvim'
    Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
    Plugin 'nvim-treesitter/nvim-treesitter'
    Plugin 'neovim/nvim-lspconfig'
    Plugin 'preservim/nerdcommenter'
    Plugin 'hrsh7th/cmp-nvim-lsp'
    Plugin 'hrsh7th/cmp-buffer'
    Plugin 'hrsh7th/cmp-path'
    Plugin 'hrsh7th/cmp-cmdline'
    Plugin 'hrsh7th/nvim-cmp'
    Plugin 'L3MON4D3/LuaSnip'
    Plugin 'saadparwaiz1/cmp_luasnip'
    Plugin 'windwp/nvim-autopairs'
    Plugin 'rafamadriz/friendly-snippets'
    Plugin 'lvimuser/lsp-inlayhints.nvim'
endif
""" Removed plugins
" Plugin 'artur-shaik/vim-javacomplete2'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'terryma/vim-smooth-scroll'
" Plugin 'racer-rust/vim-racer'
" Plugin 'bufbuild/vim-buf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
syntax sync minlines=200
syntax sync maxlines=800

set background=dark
set encoding=UTF-8

colorscheme solarized
set nobackup
set nowritebackup
set bs=2
set tabstop=4
set shiftwidth=4
set expandtab
set smartcase
set clipboard=unnamedplus
set showcmd
set autoindent
set number
set laststatus=2
set relativenumber
set directory^=$HOME/.vim/tmp//
set noswapfile
set notagrelative
set ttimeoutlen=50
set updatetime=300
let mapleader=";"
"set statusline^=%{coc#status()}
set colorcolumn=""
set synmaxcol=600
set re=1
set mouse=a
"set signcolumn=yes
" Allow project specific .vimrc
set exrc

" Folds
set foldlevel=1
set foldclose=all
set foldmethod=manual

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml,yml setlocal shiftwidth=2 tabstop=2
autocmd FileType c,cpp,java,php,js,py autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Java Autocomplete
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"
"
"nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
"nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
"nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
"nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
"
"let g:JavaComplete_LibsPath = $JAVA_PROJECT_ROOT . '/build/classes/java/main:' . $JAVA_PROJECT_ROOT . '/build/generated/sources/annotationProcessor/java/main:' . $JAVA_PROJECT_ROOT . '/generated-sources/main/java:' . $JAVA_PROJECT_ROOT . '/build/generated-main-avro-java:' . '/home/heitor/.gradle/caches/modules-2/files-2.1'
"
" end Java Autocomplete

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__']
if has('nvim')
    map <C-n> :NvimTreeToggle<CR>
else
    map <C-n> :NERDTreeToggle<CR>
endif

" Tab config
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
nnoremap <silent> <Leader><Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <Leader><Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

let notabs = 0
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

nnoremap <Leader>. :CtrlPTag<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

let g:gutentags_ctags_tagfile = './.git/.tags'
let g:gutentags_ctags_extra_args = ['--tag-relative=no']
" GOFLAGS to avoid gopls lint error when reading mage files
let $GOFLAGS="-tags=mage"
let g:loaded_youcompleteme = 1

" let g:gutentags_file_list_command = {'markers': {'.pythontags': '/home/heitor/workspace/scripts/python_file_lister.py'}}

" Remove trailing whitespaces on save
" autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> %s/\s\+$//e

" jedi-vim
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#completions_enabled = 1
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"
"
"let g:jedi#goto_assignments_command = "<leader>pa"
"let g:jedi#goto_definitions_command = "<leader>pd"
"let g:jedi#documentation_command = "<leader>pk"
"let g:jedi#usages_command = "<leader>pu"
"let g:jedi#rename_command = "<leader>pr"
"
" Ctrl P
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 250

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
"

" Remove YouCompleteMe preview window
"set completeopt-=preview
set pastetoggle=<C-b>

" com FindTODO :vimgrep /\<TODO\>/j **/*.py | :cope

let g:go_hightlight_fields = 1
let g:go_hightlight_types = 1
let g:go_hightlight_function_calls = 1
let g:go_auto_sameids = 0
let g:go_autodetect_gopath = 0
let g:go_search_bin_path_first = 1
let g:go_fmt_command = "goimports"

autocmd FileType go nmap <leader>B  <Plug>(go-build)
autocmd FileType go nmap <leader>R  <Plug>(go-run)

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'python': ['flake8', 'mypy'], 'javascript': ['prettier-eslint'], 'typescript': ['eslint'], 'rust': ['analyzer'], 'go': ['go build', 'gofmt'], 'java': ['javac'], 'proto': ['buf-lint'], 'ruby': [], 'cpp': ['g++'], "sql": ['sqlfluff']}
let g:ale_fixers = {'python': ['black', 'isort'], 'javascript': ['prettier'], 'typescript': ['prettier'], 'rust': [], 'java': ['google_java_format'], '*': ['remove_trailing_lines', 'trim_whitespace'], 'ruby': [], 'cpp': ['clang-format'], 'terraform': ['terraform'], "proto": ['buf-format'], "sql": ['sqlfluff']}
let g:ale_python_mypy_options = '--namespace-packages --ignore-missing-imports --check-untyped-defs'
let g:ale_sql_sqlfluff_options = '--dialect postgres'
let g:ale_java_javac_options = '-Xlint -Xlint:-serial'
let g:ale_java_google_java_format_executable = 'google-java-format'
let g:ale_java_google_java_format_options = '-a'
let g:ale_proto_protoc_gen_lint_options = '-I'  . $PROJECT_ROOT . ' -I'  . $GOOGLEAPIS_ROOT
let g:ale_rust_rustc_options = ''
let g:ale_rust_ignore_error_codes = ['E0658', 'E0432', 'E0433']
let g:ale_rust_analyzer_executable = '/home/heitor/.config/coc/extensions/coc-rust-analyzer-data/rust-analyzer'
let g:ale_cpp_cc_options = '-std=c++20 -Wall'
let g:ale_cpp_cc_executable = 'g++'
let g:ale_c_clangformat_options = '--style=Google'
let g:ale_linters_explicit = 1
command! ALEDisableFixers       let g:ale_fix_on_save=0
command! ALEEnableFixers        let g:ale_fix_on_save=1
command! ALEDisableFixersBuffer let b:ale_fix_on_save=0
command! ALEEnableFixersBuffer  let b:ale_fix_on_save=0


" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
"let g:ale_java_javac_classpath = g:JavaComplete_LibsPath

let g:rustfmt_autosave = 1

" Reload file on change
set autoread
au FocusGained,BufEnter * :checktime
noremap <F12> :w <CR> :make <CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-w>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style = "google"

" Rst projects
let project1 = {'Name': "Trail CLI", 'master_doc': 'README', 'path': '~/workspace/admobilize/libraries/admobilize-utils-python/trail'}
let g:riv_projects = [project1]

"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 4)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 4)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

"au FileType rust nmap <buffer> <leader>gd <Plug>(rust-def)
"au FileType rust nmap <buffer> <leader>gs <Plug>(rust-def-split)
"au FileType rust nmap <buffer> <leader>gx <Plug>(rust-def-vertical)
"au FileType rust nmap <buffer> <leader>gt <Plug>(rust-def-tab)
"au FileType rust nmap <buffer> <leader>gc <Plug>(rust-doc)

"au FileType rust nmap <buffer> <leader>gt :YcmCompleter GoTo<CR>
"au FileType rust nmap <buffer> <leader>gd :YcmCompleter GoToDeclaration<CR>
"au FileType rust nmap <buffer> <leader>gd :YcmCompleter GoTo<CR>
"au FileType rust nmap <buffer> <leader>gf :YcmCompleter GoToDefinition<CR>
"au FileType rust nmap <buffer> <leader>gr :YcmCompleter GoToReferences<CR>
"au FileType rust nmap <buffer> <leader>gm :YcmCompleter GoToImplementation<CR>
"au FileType rust nmap <buffer> <leader>gy :YcmCompleter GoToType<CR>
"au FileType rust nmap <buffer> <leader>fi :YcmCompleter FixIt<CR>
"au FileType rust nmap <buffer> <leader>rr :YcmCompleter RefactorRename<space>
"au FileType rust nmap <buffer> <leader>oi :YcmCompleter OrganizeImports<CR>

"autocmd FileType rust nnoremap <buffer> <leader>gd <Plug>(coc-definition)
"autocmd FileType rust nnoremap <buffer> <leader>gf <Plug>(coc-type-definition)
"autocmd FileType rust nnoremap <buffer> <leader>gr <Plug>(coc-references)
"autocmd FileType rust nnoremap <buffer> <leader>gm <Plug>(coc-implementation)
"autocmd FileType rust nnoremap <buffer> <leader>fi <Plug>(coc-fix-current)
"autocmd FileType rust nnoremap <buffer> <leader>cl <Plug>(coc-codelens-action)
"autocmd FileType rust nnoremap <buffer> <leader>rr <Plug>(coc-rename)
"autocmd FileType rust nnoremap <buffer> <leader>oi :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
"autocmd FileType rust nnoremap <buffer> <leader>ih :CocCommand document.toggleInlayHint<CR>

"autocmd FileType python nnoremap <buffer> <leader>gd <Plug>(coc-definition)
"autocmd FileType python nnoremap <buffer> <leader>gf <Plug>(coc-type-definition)
"autocmd FileType python nnoremap <buffer> <leader>gr <Plug>(coc-references)
"autocmd FileType python nnoremap <buffer> <leader>gm <Plug>(coc-implementation)
"autocmd FileType python nnoremap <buffer> <leader>fi <Plug>(coc-fix-current)
"autocmd FileType python nnoremap <buffer> <leader>cl <Plug>(coc-codelens-action)
"autocmd FileType python nnoremap <buffer> <leader>rr <Plug>(coc-rename)
"autocmd FileType python nnoremap <buffer> <leader>oi :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
"autocmd FileType python nnoremap <buffer> <leader>ih :CocCommand document.toggleInlayHint<CR>


"nnoremap <buffer> <leader>gt :YcmCompleter GoTo<CR>
"nnoremap <buffer> <leader>gd :YcmCompleter GoToDeclaration<CR>
"nnoremap <buffer> <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <buffer> <leader>gr :YcmCompleter GoToReferences<CR>
"nnoremap <buffer> <leader>gm :YcmCompleter GoToImplementation<CR>
"nnoremap <buffer> <leader>gy :YcmCompleter GoToType<CR>
"nnoremap <buffer> <leader>fi :YcmCompleter FixIt<CR>
"nnoremap <buffer> <leader>rr :YcmCompleter RefactorRename<space>
"nnoremap <buffer> <leader>oi :YcmCompleter OrganizeImports<CR>

"autocmd FileType go nnoremap <buffer> <leader>gt :GoDef<CR>
"autocmd FileType go nnoremap <buffer> <leader>gd :GoDef<CR>
"autocmd FileType go nnoremap <buffer> <leader>gf :GoDefType<CR>
"autocmd FileType go nnoremap <buffer> <leader>gr :GoReferrers<CR>
"autocmd FileType go nnoremap <buffer> <leader>gm :GoImplements<CR>
"autocmd FileType go nnoremap <buffer> <leader>gy :GoDefType<CR>
"autocmd FileType go nnoremap <buffer> <leader>fi :GoMetaLinter<CR>
"autocmd FileType go nnoremap <buffer> <leader>rr :GoRename<space>
"autocmd FileType go nnoremap <buffer> <leader>oi :GoImport<space>
"autocmd FileType go nnoremap <buffer> <leader>od :GoDrop<space>
"autocmd FileType go nnoremap <buffer> <leader>ge :GoIfErr<CR>
"au filetype go inoremap <buffer> . .<C-x><C-o>

" Typescript
let g:typescript_compiler_options = '--esModuleInterop'

" Vim-test
function! DebugStrategy(cmd)
  echo '' . a:cmd
  let cmd_list = split(a:cmd)
  if cmd_list[0] == 'python'
      let test_target = cmd_list[-1]
  elseif cmd_list[0] == 'go'
      let test_to_run = cmd_list[-2]
      if test_to_run[0] == "'"
          let test_target = substitute(cmd_list[-2], "'", "", "g")
      else
          let test_target = ".*"
      endif
  else
      let test_target = a:cmd
  endif
  echo 'It works! Command for running tests: ' . test_target
  call vimspector#LaunchWithSettings( #{ configuration: 'Run Test',
              \ Test: test_target } )
endfunction

let g:test#custom_strategies = {'debug': function('DebugStrategy')}

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-u> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Test debug
nmap <silent> td<C-n> :TestNearest -strategy=debug<CR>
nmap <silent> td<C-f> :TestFile -strategy=debug<CR>
nmap <silent> td<C-u> :TestSuite -strategy=debug<CR>
nmap <silent> td<C-l> :TestLast -strategy=debug<CR>
nmap <silent> td<C-g> :TestVisit -strategy=debug<CR>
let test#strategy = "vimux"
" let test#strategy = "vimspector"

" vimspector
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' , 'delve' , 'vscode-node-debug2']
let g:vimspector_enable_mappings = "HUMAN"
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <Leader>db <Plug>VimspectorBreakpoints
nnoremap <silent> <leader>dr :call vimspector#Reset( { 'interactive': v:false } )<CR>
nnoremap <leader>dn :call vimspector#StepOver()<CR>
nnoremap <leader>ds :call vimspector#StepInto()<CR>
nnoremap <leader>do :call vimspector#StepOut()<CR>
nnoremap <leader>dc :call vimspector#RunToCursor()<CR>
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         995,
  \    'vimspectorBPCond':     994,
  \    'vimspectorBPLog':      993,
  \    'vimspectorBPDisabled': 992,
  \    'vimspectorPC':         998,
  \ }

" Prevent pressing q to start recording
noremap <Leader>q q
noremap q <Nop>


"Echodoc
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
" To use a custom highlight for the popup window,
" change Pmenu to your highlight group
"highlight link EchoDocPopup Pmenu
"
" coc.nvim
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"inoremap <silent><expr> <c-@> coc#refresh()
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"highlight CocFloating ctermbg=8
"highlight CocMenuSel ctermbg=0
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"function! s:enable_coc_for_type()
"    let l:filesuffix_whitelist = ['c', 'cpp', 'go', 'rs', 'py', 'yaml']
"	if index(l:filesuffix_whitelist, expand('%:e')) == -1
"		let b:coc_enabled = 0
"	endif
"endfunction
"autocmd BufRead,BufNewFile * call s:enable_coc_for_type()
"
if has('nvim')
    let g:CommandTPreferredImplementation='lua'
    set clipboard+=unnamedplus

    " Telescope settings
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fm <cmd>lua git_diff()<cr>

    " Clear search highlight
    nnoremap <Leader>/ :noh<cr>

"    autocmd CursorHold *.{c,cpp,hpp,hs,py,rs,go,js,ts} if (coc#rpc#ready() && CocHasProvider('hover') && !coc#float#has_float()) | silent call CocActionAsync('doHover') | endif
"    autocmd BufAdd * if getfsize(expand('<afile>')) > 1 |
"				\ let b:coc_enabled=0 |
"				\ endif
endif

set regexpengine=0

set secure
