" If quicktex_usedefault is explicitly set to 0, don't load this file
if !get(g:, 'quicktex_usedefault', 1)
    finish
endif

" Keyword mappings are simply a dictionary. Dictionaries are of the form
" "quicktex_" and then the filetype. The result of a keyword is either a
" literal string or a double quoted string, depending on what you want.
"
" In a literal string, the result is just a simple literal substitution
"
" In a double quoted string, \'s need to be escape (i.e. "\\"), however, you
" can use nonalphanumberical keypresses, like "\<CR>", "\<BS>", or "\<Right>"
"
" Unfortunately, comments are not allowed inside multiline vim dictionaries.
" Thus, sections and comments must be included as entries themselves. Make
" sure that the comment more than one word, that way it could never be called
" by the ExpandWord function


" Quicktex {{{


function! QuickModifier(modifier)
  " Search backward for a space
  " Check if the character after the space is $
  if search('[ \$]', 'b', line('.'))
    execute "normal! a" . a:modifier . "(\<ESC>f i)"
  else
   " No space found, move to the beginning of the line and insert the modifier
   execute "normal! 0i" . a:modifier . "(\<ESC>f i)"
  endif
endfunction


let g:quicktex_typst = {
    \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'mf'  : '$<+++>$ <++>',
    \'dm'  : '$ <+++> $ <++>',
\'Section: Environments' : 'COMMENT',
    \'thm' : "#theorem[\<CR><+++>\<CR>] <++>",
    \'lem' : "#lemma[\<CR><+++>\<CR>] <++>",
    \'cor' : "#corollary[\<CR><+++>\<CR>] <++>",
    \'prf' : "#proof[\<CR><+++>\<CR>] <++>",
    \'lst' : "#enum[\<CR>  - <+++>\<CR>] <++>",
    \'eq'  : "$\<CR><+++>\<CR>$ <++>",
    \'bol' : "*<+++>* <++>",
    \'ref' : "@<+++> <++>",
    \'ita' : "_<+++>_ <++>",
    \'footn': "#footnote[<+++>] <++>",
    \'fig' : "#figure[\<CR>#image(\"figures/<+++>.png\", width: 80%)\<CR>#caption[<++>]\<CR>] <++>",
\'Section: Common Sets' : 'COMMENT',
    \'bn' : '$NN$ ',
    \'bz' : '$ZZ$ ',
    \'bq' : '$QQ$ ',
    \'br' : '$RR$ ',
    \'bc' : '$CC$ ',
    \'ba' : '$AA$ ',
    \'bf' : '$FF$ ',
\}

let g:quicktex_math_typst = {
    \' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
\'Section: Lowercase Greek Letters' : 'COMMENT',
    \'ga'      : 'alpha ',
    \'ge'      : 'epsilon ',
    \'gl'      : 'lambda ',
    \'gu'      : 'upsilon ',
\'Section: Set Theory' : 'COMMENT',
    \'bn'    : 'NN ',
    \'bz'    : 'ZZ ',
    \'be'    : 'EE ',
    \'bd'    : 'DD ',
    \'bk'    : 'KK ',
    \'bq'    : 'QQ ',
    \'bp'    : 'PP ',
    \'br'    : 'RR ',
    \'bc'    : 'CC ',
    \'ba'    : 'AA ',
    \'bf'    : 'FF ',
    \'subs'  : 'subset ',
    \'subsneq': 'subset.neq ',
    \'in'    : 'in ',
    \'ni'    : 'ni ',
    \'nin'   : 'in.not ',
    \'cup'   : 'union ',
    \'cap'   : 'sect ',
    \'union' : 'union ',
    \'sect'  : 'sect ',
    \'smin'  : 'setminus ',
    \'set'   : '{<+++>} <++>',
    \'empty' : 'empty ',
    \'pair'  : '(<+++>, <++>) <++>',
\'Section: Logic' : 'COMMENT',
    \'exst'  : 'exists ',
    \'nexst' : 'exists.not ',
    \'forall'  : 'forall ',
    \'impl' : 'arrow.r.double ',
    \'iff'     : 'arrow.l.r.double ',
\'Section: Relations' : 'COMMENT',
    \'lt'      : '< ',
    \'gt'      : '> ',
    \'leq'     : '<= ',
    \'geq'     : '>= ',
    \'eq'      : '= ',
    \'equiv'   : 'equiv ',
    \'nl'      : 'not < ',
    \'ng'      : 'not > ',
    \'nleq'    : 'not <= ',
    \'ngeq'    : 'not >= ',
    \'neq'     : '!= ',
    \'neg'     : 'not ',
\'Section: Operations' : 'COMMENT',
    \'add'   : '+ ',
    \'min'   : '- ',
    \'frac'  : '(<+++>)/(<++>) <++>',
    \'dot'   : 'dot ',
    \'mult'  : 'times ',
    \'partial': 'diff ',
    \'exp'   : "\<BS>^(<+++>) <++>",
    \'pow'   : "\<BS>^(<+++>) <++>",
    \'sq'    : "\<BS>^2 ",
    \'cubed' : "\<BS>^3 ",
    \'inv'   : "\<BS>^(-1) ",
    \'cross' : 'times ',
\'Section: Functions' : 'COMMENT',
    \'to'     : 'arrow ',
    \'mapsto' : 'arrow.bar ',
    \'comp'   : 'circle ',
    \'of'     : "(<+++>) <++>",
    \'sin'    : 'sin ',
    \'cos'    : 'cos ',
    \'tan'    : 'tan ',
    \'ln'     : 'ln ',
    \'log'    : 'log ',
    \'sqrt'   : 'sqrt(<+++>) <++>',
\'Section: Constants' : 'COMMENT',
    \'inf'   : 'infinity ',
    \'one'   : '1 ',
    \'zero'  : '0 ',
    \'two'   : '2 ',
    \'three' : '3 ',
    \'four'  : '4 ',
\'Section: Operators' : 'COMMENT',
    \'int'    : 'integral <+++> dif <++> ',
    \'sum'    : 'sum ',
    \'prod'   : 'product ',
    \'sup'    : 'sup ',
    \'sinf'   : 'inf ',
\'Typst Commands' : 'COMMENT',
    \'sub'    : "\<BS>_(<+++>) <++>",
    \'sn'     : "\<BS>_n ",
    \'si'     : "\<BS>_i ",
    \'s0'     : "\<BS>_0 ",
    \'s1'     : "\<BS>_1 ",
    \'s2'     : "\<BS>_2 ",
    \'s3'     : "\<BS>_3 ",
    \'s4'     : "\<BS>_4 ",
    \'ud'     : "\<BS>_(<+++>)^(<++>) <++>",
    \'text'   : '"<+++>" <++>',
    \'bol'    : "bold(<+++>) <++>",
    \'bar'    : "\<ESC>:call QuickModifier('bar')\<CR>",
    \'tild'   : "\<ESC>:call QuickModifier('tilde')\<CR>",
    \'hat'    : "\<ESC>:call QuickModifier('hat')\<CR>",
    \'star'   : "\<BS>^* ",
\}
" }}}
