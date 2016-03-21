.global ___setjmp
.hidden ___setjmp
.global __setjmp
.global _setjmp
.global setjmp
.type __setjmp,@function
.type _setjmp,@function
.type setjmp,@function
.align 4
___setjmp:
__setjmp:
_setjmp:
setjmp:
#if defined(__XTENSA_CALL0_ABI__)
	s32i	a0, a2, 0
	s32i	a1, a2, 4
	s32i	a12, a2, 8
	s32i	a13, a2, 12
	s32i	a14, a2, 16
	s32i	a15, a2, 20
	movi	a2, 0
	ret
#else
#error Unsupported Xtensa ABI
#endif
