.global __setjmp
.global _setjmp
.global setjmp
.type __setjmp,@function
.type _setjmp,@function
.type setjmp,@function
.align 4
__setjmp:
_setjmp:
setjmp:
	entry	a1, 16
	movi	a3, 0
	j	___sigsetjmp
