.global sigsetjmp
.global __sigsetjmp
.type sigsetjmp,@function
.type __sigsetjmp,@function
.align 4
sigsetjmp:
__sigsetjmp:
	bnez	a3, 1f
.hidden ___setjmp
	j	___setjmp
1:
	s32i	a0, a2, 24
	s32i	a12, a2, 36
	mov	a12, a2
	call0	___setjmp
	mov	a3, a2
	mov	a2, a12
	l32i	a12, a2, 36
	l32i	a0, a2, 24

.hidden __sigsetjmp_tail
	j	__sigsetjmp_tail
