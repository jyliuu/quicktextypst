if exists('g:quicktex_tex') && !exists('g:quicktex_math')
    let g:quicktex_math = {}
    finish
elseif !exists('g:quicktex_tex') && exists('g:quicktex_math')
    let g:quicktex_tex = {}
    finish
elseif exists('g:quicktex_tex') && exists('g:quicktex_math')
    finish
endif

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

" Math Mode Keywords {{{

let g:quicktex_math = {
    \' ' : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
\'Section: Lowercase Greek Letters' : 'COMMENT',
    \'alpha'   : '\alpha ',
    \'ga'      : '\alpha ',
    \'beta'    : '\beta ',
    \'gamma'   : '\gamma ',
    \'delta'   : '\delta ',
    \'epsilon' : '\epsilon ',
    \'ge'      : '\varepsilon ',
    \'zeta'    : '\zeta ',
    \'eta'     : '\eta ',
    \'theta'   : '\theta ',
    \'iota'    : '\iota ',
    \'kappa'   : '\kappa ',
    \'lambda'  : '\lambda ',
    \'gl'      : '\lambda ',
    \'mu'      : '\mu ',
    \'nu'      : '\nu ',
    \'xi'      : '\xi ',
    \'omega'   : '\omega ',
    \'pi'      : '\pi ',
    \'rho'     : '\rho ',
    \'sigma'   : '\sigma ',
    \'tau'     : '\tau ',
    \'upsilon' : '\upsilon ',
    \'gu'      : '\upsilon ',
    \'phi'     : '\varphi ',
    \'chi'     : '\chi ',
    \'psi'     : '\psi ',
    \
\'Section: Uppercase Greek Letters' : 'COMMENT',
    \'Alpha'   : '\Alpha ',
    \'Beta'    : '\Beta ',
    \'Gamma'   : '\Gamma ',
    \'Delta'   : '\Delta ',
    \'Epsilon' : '\Epsilon ',
    \'Zeta'    : '\Zeta ',
    \'Eta'     : '\Eta ',
    \'Theta'   : '\Theta ',
    \'Iota'    : '\Iota ',
    \'Kappa'   : '\Kappa ',
    \'Lambda'  : '\Lambda ',
    \'Mu'      : '\Mu ',
    \'Nu'      : '\Nu ',
    \'Xi'      : '\Xi ',
    \'Omega'   : '\Omega ',
    \'Pi'      : '\Pi ',
    \'Rho'     : '\Rho ',
    \'Sigma'   : '\Sigma ',
    \'Tau'     : '\Tau ',
    \'Upsilon' : '\Upsilon ',
    \'Phi'     : '\Phi ',
    \'Chi'     : '\Chi ',
    \'Psi'     : '\Psi ',
    \
\'Section: Set Theory' : 'COMMENT',
    \'bn'    : '\mathbb{N} ',
    \'bz'    : '\mathbb{Z} ',
    \'bq'    : '\mathbb{Q} ',
    \'br'    : '\mathbb{R} ',
    \'bc'    : '\mathbb{C} ',
    \'ba'    : '\mathbb{A} ',
    \'bf'    : '\mathbb{F} ',
    \'subs'  : '\subseteq ',
    \'in'    : '\in ',
    \'nin'   : '\not\in ',
    \'cup'   : '\cup ',
    \'cap'   : '\cap ',
    \'union' : '\cup ',
    \'sect'  : '\cap ',
    \'smin'  : '\setminus ',
    \'set'   : '\{<+++>\} <++>',
    \'empty' : '\varnothing ',
    \'pair'  : '(<+++>, <++>) <++>',
    \'dots'  : '\dots ',
    \
\'Section: Logic' : 'COMMENT',
    \'exists'  : '\exists ',
    \'nexists' : '\nexists ',
    \'forall'  : '\forall ',
    \'implies' : '\implies ',
    \'iff'     : '\iff ',
    \
\'Section: Relations' : 'COMMENT',
    \'lt'      : '< ',
    \'gt'      : '> ',
    \'leq'     : '\leq ',
    \'geq'     : '\geq ',
    \'eq'      : '= ',
    \'nl'      : '\nless ',
    \'ng'      : '\ngtr ',
    \'nleq'    : '\nleq ',
    \'ngeq'    : '\ngeq ',
    \'neq'     : '\neq ',
    \'neg'     : '\neg ',
    \
\'Section: Operations' : 'COMMENT',
    \'add'   : '+ ',
    \'min'   : '- ',
    \'frac'  : '\frac{<+++>}{<++>} <++>',
    \'recip' : '\frac{1}{<+++>} <++>',
    \'dot'   : '\cdot ',
    \'mult'  : '* ',
    \'exp'   : "\<BS>^{<+++>} <++>",
    \'pow'   : "\<BS>^{<+++>} <++>",
    \'sq'    : "\<BS>^2 ",
    \'inv'   : "\<BS>^{-1} ",
    \'cross' : '\times ',
    \
\'Section: Delimiters' : 'COMMENT',
    \'bpara' : '\left( <+++> \right) <++>',
    \'para'  : '(<+++>) <++>',
    \'bsb'   : '\left[ <+++> \right] <++>',
    \'sb'    : '[<+++>] <++>',
    \'bbra'  : '\left\{ <+++> \right\} <++>',
    \'bra'   : '\{<+++>\} <++>',
    \
\'Section: Group Theory' : 'COMMENT',
    \'sdp'   : '\rtimes ',
    \'niso'  : '\niso ',
    \'subg'  : '\leq ',
    \'nsubg' : '\trianglelefteq ',
    \'mod'   : '/ ',
    \
\'Section: Functions' : 'COMMENT',
    \'to'     : '\to ',
    \'mapsto' : '\mapsto ',
    \'comp'   : '\circ ',
    \'of'     : "\<BS>(<+++>) <++>",
    \'sin'    : '\sin{<+++>} <++>',
    \'cos'    : '\cos{<+++>} <++>',
    \'tan'    : '\tan{<+++>} <++>',
    \'gcd'    : '\gcd(<+++> ,<++>) <++>',
    \'ln'     : '\ln{<+++>} <++>',
    \'log'    : '\log{<+++>} <++>',
    \'df'     : '<+++> : <++> \to <++>',
    \'sqrt'   : '\sqrt{<+++>} <++>',
    \'case'   : '\begin{cases} <+++> \end{cases} <++>',
    \
\'Section: LaTeX commands' : 'COMMENT',
    \'sub'    : "\<BS>_{<+++>} <++>",
    \'sone'   : "\<BS>_1 ",
    \'stwo'   : "\<BS>_2 ",
    \'sthree' : "\<BS>_3 ",
    \'sfour'  : "\<BS>_4 ",
    \'text'   : '\text{<+++>} <++>',
    \
\'Section: Fancy Variables' : 'COMMENT',
    \'fA' : '\mathcal{A} ',
    \'fo' : '\mathcal{O} ',
    \'fn' : '\mathcal{N} ',
    \'fp' : '\mathcal{P} ',
    \'ft' : '\mathcal{T} ',
    \'fc' : '\mathcal{C} ',
    \'fm' : '\mathcal{M} ',
    \'ff' : '\mathcal{F} ',
    \'fz' : '\mathcal{Z} ',
    \'fi' : '\mathcal{I} ',
    \'fb' : '\mathcal{B} ',
    \'fl' : '\mathcal{L} ',
    \'fv' : '\mathcal{V} ',
    \
\'Section: Encapsulating keywords' : 'COMMENT',
    \'hat'  : "\<ESC>Bi\\hat{\<ESC>Els} ",
    \'bar'  : "\<ESC>Bi\\overline{\<ESC>Els} ",
    \'tild'  : "\<ESC>Bi\\tild{\<ESC>Els} ",
    \'vec'  : "\<ESC>Bi\\vec{\<ESC>Els} ",
    \
\'Section: Linear Algebra' : 'COMMENT',
    \'GL'     : '\text{GL} ',
    \'SL'     : '\text{SL} ',
    \'com'    : "\<BS>^c ",
    \'matrix' : "\<CR>\\begin{bmatrix}\<CR><+++>\<CR>\\end{bmatrix}\<CR><++>",
    \'vdots'  : '\vdots & ',
    \'ddots'  : '\ddots & ',
    \
\'Section: Constants' : 'COMMENT',
    \'aleph' : '\aleph ',
    \'inf'   : '\infty ',
    \'one'   : '1 ',
    \'zero'  : '0 ',
    \'two'   : '2 ',
    \'three' : '3 ',
    \'four'  : '4 ',
    \
\'Section: Operators' : 'COMMENT',
    \'int'    : '\int <+++> \mathop{d <++>} <++>',
    \'dev'    : '\frac{d}{d <+++>} <++>',
    \'lim'    : '\lim_{<+++>} <++>',
    \'sum'    : '\sum ',
    \'prod'   : '\prod ',
    \'limsup' : '\limsup ',
    \'liminf' : '\liminf ',
    \'sup'    : '\sup ',
    \'sinf'   : '\inf ',
\}

" }}}

" LaTeX Mode Keywords {{{

let g:quicktex_tex = {
    \' ' : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
    \'m' : '\( <+++> \) <++>',
\'Section: Environments' : 'COMMENT',
    \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}\<CR><+++>\<CR>\\end{\<ESC>pa}",
    \'exe' : "\\begin{exercise}{<+++>}\<CR><++>\<CR>\\end{exercise}",
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
    \'thm' : "\\begin{theorem}\<CR><+++>\<CR>\\end{theorem}",
    \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
    \'eq'  : "\\begin{displaymath}\<CR><+++>\<CR>\\end{displaymath}",
    \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
    \
\'Section: Other Commands' : 'COMMENT',
    \'itm'  : '\item ',
    \'sect' : "\\section*{<+++>}\<CR><++>",
    \'para' : '(<+++>) <++>',
    \'qt'   : "``<+++>'' <++>",
    \
\'Section: Common Sets' : 'COMMENT',
    \'bn' : '\(\mathbb{N}\) ',
    \'bz' : '\(\mathbb{Z}\) ',
    \'bq' : '\(\mathbb{Q}\) ',
    \'br' : '\(\mathbb{R}\) ',
    \'bc' : '\(\mathbb{C}\) ',
    \'ba' : '\(\mathbb{A}\) ',
    \'bf' : '\(\mathbb{F}\) ',
\'Section: Fancy Variables' : 'COMMENT',
    \'fA' : '\(\mathcal{A}\) ',
    \'fo' : '\(\mathcal{O}\) ',
    \'fn' : '\(\mathcal{N}\) ',
    \'fp' : '\(\mathcal{P}\) ',
    \'ft' : '\(\mathcal{T}\) ',
    \'fc' : '\(\mathcal{C}\) ',
    \'fm' : '\(\mathcal{M}\) ',
    \'ff' : '\(\mathcal{F}\) ',
    \'fz' : '\(\mathcal{Z}\) ',
    \'fi' : '\(\mathcal{I}\) ',
    \'fb' : '\(\mathcal{B}\) ',
    \'fl' : '\(\mathcal{L}\) ',
    \'fv' : '\(\mathcal{V}\) ',
\'Section: Greek Letters' : 'COMMENT',
    \'alpha'   : '\(\alpha\) ',
    \'ga'      : '\(\alpha\) ',
    \'beta'    : '\(\beta\) ',
    \'gamma'   : '\(\gamma\) ',
    \'delta'   : '\(\delta\) ',
    \'epsilon' : '\(\varepsilon\) ',
    \'ge'      : '\(\varepsilon\) ',
    \'zeta'    : '\(\zeta\) ',
    \'eta'     : '\(\eta\) ',
    \'theta'   : '\(\theta\) ',
    \'iota'    : '\(\iota\) ',
    \'kappa'   : '\(\kappa\) ',
    \'lambda'  : '\(\lambda\) ',
    \'gl'      : '\(\lambda\) ',
    \'mu'      : '\(\mu\) ',
    \'nu'      : '\(\nu\) ',
    \'xi'      : '\(\xi\) ',
    \'omega'   : '\(\omega\) ',
    \'pi'      : '\(\pi\) ',
    \'rho'     : '\(\rho\) ',
    \'sigma'   : '\(\sigma\) ',
    \'tau'     : '\(\tau\) ',
    \'upsilon' : '\(\upsilon\) ',
    \'gu'      : '\(\upsilon\) ',
    \'phi'     : '\(\varphi\) ',
    \'chi'     : '\(\chi\) ',
    \'psi'     : '\(\psi\) ',
    \
\}

" }}}
