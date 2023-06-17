syntax on
set number
set autoindent
set cindent
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
set smarttab
set mouse=a
set hlsearch
set ruler
set autochdir
set belloff=all

colo gruvbox

" map kj to ESC
imap kj <Esc>

nnoremap mm :call CompileRun()<CR>
nnoremap <F10> :%w !pbcopy<CR>

func! CompileRun()
    exec "w"

    " CompileRun Func
    if (&filetype == 'java')
        exec "!javac -d ../bin %"
        exec "!java -cp ../bin %:r < ~/.input.txt"


    elseif (&filetype == 'python')
        exec "!python3 % < ~/.input.txt"

    elseif (&filetype == 'c')
        exec "!gcc % -o ../bin/%:r"
        exec "!../bin/%:r < ~/.input.txt"

    elseif (&filetype == 'cpp')
        exec "!g++ -std=c++11 % -o ../bin/%:r"
        exec "!../bin/%:r < ~/.input.txt"

    elseif (&filetype == 'rust')
        exec "!rustc % -o ../bin/%:r"
        exec "!../bin/%:r < ~/.input.txt"

    elseif (&filetype == 'go')
        exec "!go build Main.go"
        exec "!./Main"

    endif

endfunc

let g:clang_options = '-std=c++11 -Wno-c++11-extensions'

