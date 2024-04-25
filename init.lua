require("mauri")

vim.cmd([[
" comment code
let g:comment_symbols={
            \ 'dockerfile': {'line': '#'},
            \ 'go': {'line': '//', 'block': ['/*', '*/']},
            \ 'gomod': {'line': '//'},
            \ 'groovy': {'line': '//'},
            \ 'lua': {'line': '--'},
            \ 'html': {'block': ['<!--', '-->']},
            \ 'lisp': {'line': ';;', 'block': ['#|', '|#']},
            \ 'clojure': {'line': ';;'},
            \ 'make': {'line': '#', '^': 1},
            \ 'python': {'line': '#', 'block': ['"""', '"""']},
            \ 'sh': {'line': '#'},
            \ 'sql': {'line': '--'},
            \ 'vim': {'line': '"'},
            \ 'yaml': {'line': '#'},
            \ }
" actually <C-_> means CTRL + /
map <C-_> <leader>cc
nnoremap <leader>cc :ToggleLineComment<CR>
vnoremap <leader>cc :ToggleLineComment<CR>
nnoremap <leader>cb :ToggleBlockCommentNormal<CR>
vnoremap <leader>cb :ToggleBlockCommentVisual<CR>

command -range ToggleLineComment <line1>,<line2>call ToggleComment('line', '')
command -range ToggleBlockCommentVisual call ToggleComment('block', 'v')
command ToggleBlockCommentNormal call ToggleComment('block', 'n')

func ToggleComment(comment_type, mode)
    if !has_key(g:comment_symbols, &ft)
        return
    endif
    let l:comment=g:comment_symbols[&ft]

    if a:comment_type == 'line'
        if has_key(l:comment, 'line')
            let l:line_comment=l:comment['line']
            if getline(".") =~ '^\s*' . l:line_comment
                " remove the comment
                exec ':s@\(^\s*\)' . l:line_comment . ' *@\1@'
            else
                " insert the comment
                if getline(".") != ''
                    if get(l:comment, '^')
                        " the comment needs to be in the first column
                        exec ':s@\(^\s*[^\s]\)@' . l:line_comment . ' \1@'
                    else
                        exec ':s@\(^\s*\)\([^\s]\)\?@\1' . l:line_comment . ' \2@'
                    endif
                endif
            endif
        else
            call ToggleComment('block', 'n')
        endif
    elseif a:comment_type == 'block'
        if has_key(l:comment, 'block')
            let l:start_comment=escape(l:comment['block'][0], '*')
            let l:end_comment=escape(l:comment['block'][1], '*')
            if a:mode == 'v'
                let [l:lstart, l:cstart] = getpos("'<")[1:2]
                let [l:lend, l:cend] = getpos("'>")[1:2]
                let l:line_len=len(getline(l:lend))
                let l:cend = l:cend > l:line_len && l:line_len > 0 ? l:line_len : l:cend

                if getline(l:lstart) =~ '^.*' . l:start_comment . ' .*$' && getline(l:lend) =~ '^.* ' . l:end_comment . '.*$'
                    " remove the comment in the visual selection
                    exec l:lend . 's@\(^.*\) ' . l:end_comment . '\(.*$\)@\1\2@'
                    exec l:lstart . 's@\(^.*\)' . l:start_comment . ' \(.*$\)@\1\2@'
                else
                    " insert the comment wrapping the visual selection
                    exec l:lend . 's@\%' . l:cend . 'c\(.\)\?@\1 ' . l:end_comment . '@g'
                    exec l:lstart . 's@\%' . l:cstart . 'c\(.\)\?@' . l:start_comment . ' \1@g'
                endif
            elseif a:mode == 'n'
                if getline(".") =~ '^\s*' . l:start_comment . ' .* ' . l:end_comment . '$'
                    " remove the comment of the whole line
                    exec ':s@\(^\s*\)' . l:start_comment . ' \(.*\) ' . l:end_comment . '$@\1\2@'
                elseif getline('.') =~ '^.*' . l:start_comment . ' .*\%' . getpos('.')[2] . 'c.* ' . l:end_comment . '.*$'
                    " remove the comment if the cursor is inside of it
                    exec ':s@\(^.*\)' . l:start_comment . ' \(.*\%' . getpos('.')[2] . 'c.*\) ' . l:end_comment . '\(.*$\)@\1\2\3@'
                else
                    " insert the block comment in the whole line
                    exec ':s@\(^\s*\)\([^\s]\?\)@\1' . l:start_comment . ' \2@'
                    exec ':s@$@ ' . l:end_comment . '@'
                endif
            endif
        endif
    endif
endfunc
]])
