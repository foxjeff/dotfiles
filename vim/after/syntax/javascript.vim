  syntax keyword jsDom          getElementById $A $H
  syntax region  jsParent	matchgroup=Delimiter transparent start="{" end="}"    contains=ALL 
  syntax region  jsParent	matchgroup=Delimiter transparent start="(" end=")"    contains=ALL
  syntax region  jsParent	matchgroup=Delimiter transparent start="\[" end="\]"  contains=ALL
  "syntax match   jsBlock	"[({[\]})]"	contained
  hi def link jsDom		Function
  hi def link jsParent		Delimiter

