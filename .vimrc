set columns=120
nn <c-h> gt
nn <c-j> gT
set nu
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set tabstop=4
set sw=4
set expandtab
set clipboard=unnamed
filetype plugin indent on

"For MacVim or KaoriYa-Vim
"Auto IM off
set imdisable

"Thanks to: http://blog.remora.cx/2011/04/show-invisible-spaces-in-vim.html
if has("syntax")
    syntax on
 
    syn sync fromstart
 
    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    endf
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif

