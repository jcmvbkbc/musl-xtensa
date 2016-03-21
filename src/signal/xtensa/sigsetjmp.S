.global sigsetjmp
.global __sigsetjmp
.type sigsetjmp,@function
.type __sigsetjmp,@function
.align 4
sigsetjmp:
__sigsetjmp:
#if defined(__XTENSA_CALL0_ABI__)
	bnez	a3, 1f
.hidden ___setjmp
	j	___setjmp
1:
	mov	a3, a0
	mov	a4, a2
	call0	___setjmp
	mov	a0, a3
	mov	a3, a2
	mov	a2, a4

.hidden __sigsetjmp_tail
	j	__sigsetjmp_tail
#else
#error Unsupported Xtensa ABI
#endif
