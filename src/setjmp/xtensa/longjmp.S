.global _longjmp
.global longjmp
.type _longjmp,@function
.type longjmp,@function
.align 4
_longjmp:
longjmp:
#if defined(__XTENSA_CALL0_ABI__)
	l32i	a0, a2, 0
	l32i	a1, a2, 4
	l32i	a12, a2, 8
	l32i	a13, a2, 12
	l32i	a14, a2, 16
	l32i	a15, a2, 20

	movi	a2, 1
	movnez	a2, a3, a3

	ret
#else
#error Unsupported Xtensa ABI
#endif
