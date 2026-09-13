" Enable syntax highlighting
syntax on

" Show line numbers
set number
set relativenumber

" Set tab width to 2 spaces
filetype plugin indent on   " enable (ottaa käyttöön) filetype-based indenting
set autoindent               " copy (kopioida) indent from previous line
set smartindent              " smart indent for C-like languages (kieli)
set cindent                  " even better (parempi) for C/C++/Java/JS-style braces {}
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set clipboard=unnamed

autocmd FileType cpp nnoremap <F9> :w <bar> !cd "%:p:h" && clang++ -std=c++17 %:t -o %:t:r && ./%:t:r <CR>

" Keep search highlighting but clear on pressing escape
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Enable mouse integration
set mouse=a

" Use 24-bit colour (tarvitaan) for the tinted highlights below
if has('termguicolors') && $COLORTERM ==# 'truecolor'
  set termguicolors
endif

" Tint the background only, leave the foreground alone, so syntax colours
" show through the selection (läpinäkyvä) instead of being painted over
function! s:SubtleHighlights() abort
  hi Visual    guifg=NONE guibg=#2f4256 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
  hi Search    guifg=NONE guibg=#4a4327 gui=NONE ctermfg=NONE ctermbg=58  cterm=NONE
  hi IncSearch guifg=NONE guibg=#5c4a2a gui=NONE ctermfg=NONE ctermbg=94  cterm=NONE
endfunction
augroup subtle_highlights
  autocmd!
  autocmd ColorScheme * call s:SubtleHighlights()
augroup END
call s:SubtleHighlights()

