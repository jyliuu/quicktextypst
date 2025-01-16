" Set the asymmetric delimiters for math mode. The $ $ and the $$ $$ delimiters
" are handled separately, as they are symmetric. The ending braces are omitted
" in order to match the *-variants.
let s:mathModes = [['\(',                 '\)'               ],
                  \['\[',                 '\]'               ],
                  \['\begin{equation',    '\end{equation'    ],
                  \['\begin{displaymath', '\end{displaymath' ],
                  \['\begin{multline',    '\end{multline'    ],
                  \['\begin{gather',      '\end{gather'      ],
                  \['\begin{align',       '\end{align'       ]]


function! quicktex#mathmode#DollarSignMathMode()
    " Get the buffer up to the cursor position as a string
    let lines     = getline(0, '.')
    let lines[-1] = strpart(lines[-1], 0, col('.')-1)
    let lines     = join(lines, '')
    
    " Remove escaped dollar signs
    let lines = substitute(lines, '\\\$', '', 'g')
    
    " Count dollar signs before cursor
    let beforelength = strlen(lines)
    let afterlength  = strlen(substitute(lines, '\$', '', 'g'))
    let dollar_count = beforelength - afterlength
    
    " If odd number of dollar signs, we're in math mode
    return dollar_count % 2 == 1
endfunction

" Function to check if we're in LaTeX math mode
function! quicktex#mathmode#InLaTeXMathMode()
    " Get the buffer up to the cursor position as a string
    let lines     = getline(0, '.')
    let lines[-1] = strpart(lines[-1], 0, col('.')-1)
    let lines     = join(lines, '')
    " Remove escaped backslashes to avoid something like \\(
    let lines     = substitute(lines, '\\\\', '', 'g')

    " Check LaTeX math environments
    for [begin, end] in s:mathModes
        " Remove the part of the string up to the ending delimiter
        let lines_temp = strpart(lines, strridx(lines, end)+1)
        " Check if a corresponding beginning delimiter is left in the string
        if stridx(lines_temp, begin)+1
            return 1
        endif
    endfor

    " Also check for dollar signs in LaTeX
    let lines = substitute(lines, '\\\$', '', 'g')
    let beforelength = strlen(lines)
    let afterlength  = strlen(substitute(lines, '\$', '', 'g'))
    let dollar_count = beforelength - afterlength
    return dollar_count % 2 == 1
endfunction

" Main function to detect if we're in math mode based on filetype
function! quicktex#mathmode#InMathMode(ft)
    if a:ft == 'typst'
        return quicktex#mathmode#DollarSignMathMode()
    else
        return quicktex#mathmode#InLaTeXMathMode()
    endif
endfunction
