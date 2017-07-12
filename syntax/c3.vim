"
" Keywords
"

syn keyword c3Keyword   schema type extends key static function name enum server client extendable
syn keyword c3Modifiers mixes remix  member any entity stored calc expression asset id parent
syn keyword c3Types   	string double int  boolean blob datetime binary Canonical Action @DFE 
syn keyword c3TypeDef   function js 

syn region  c3Comment	start="/\*"  end="\*/" 
syn region  c3String		start=+'+ end=+'+ end=+$+ contains=@Spell
syn region  c3String		start=+"+ end=+"+ end=+$+ contains=@Spell

syn match   c3LineComment	 "//.*" 
syn match   c3Annotation	"@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>"


if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='c3'
endif


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_conf_syntax_inits")
  if version < 508
    let did_conf_syntax_inits = 1
    command! -nargs=+ C3HiLink hi link <args>
  else
    command! -nargs=+ C3HiLink hi def link <args>
  endif

  C3HiLink c3Comment          Comment
  C3HiLink c3LineComment      Comment

  C3HiLink c3Keyword          Repeat
  C3HiLink c3Modifiers        StorageClass
  C3HiLink c3Types            Function
  C3HiLink c3TypeDef          Typedef
  C3HiLink c3String           String
  C3HiLink c3Annotation       PreProc
endif


" delcommand C3HiLink

let b:current_syntax = "c3"

if main_syntax == 'c3'
  unlet main_syntax
endif

let b:spell_options="contained"
