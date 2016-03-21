.global _longjmp
.global longjmp
.type _longjmp,%function
.type longjmp,%function
.align 4
_longjmp:
longjmp:
	entry	a1, 16

	/* Invalidate all but the current register window. */
	call4	__window_spill

	l32i	a0, a2, 64
	addi	a7, a1, -16
	l32i	a4, a2, 0
	l32i	a5, a2, 4
	s32i	a4, a7, 0
	s32i	a5, a7, 4
	l32i	a4, a2, 8
	l32i	a5, a2, 12
	s32i	a4, a7, 8
	s32i	a5, a7, 12

	/* Copy the remaining 0-8 saved registers. */
	extui	a7, a0, 30, 2
	blti	a7, 2, 2f
	l32i	a8, a2, 52	/* a8: SP of 'caller-1' */
	slli	a4, a7, 4
	sub	a6, a8, a4
	addi	a5, a2, 16
	addi	a8, a8, -16	/* a8: end of overflow area */
1:
	l32i	a7, a5, 0
	l32i	a4, a5, 4
	s32i	a7, a6, 0
	s32i	a4, a6, 4
	l32i	a7, a5, 8
	l32i	a4, a5, 12
	s32i	a7, a6, 8
	s32i	a4, a6, 12
	addi	a5, a5, 16
	addi	a6, a6, 16
	bltu	a6, a8, 1b
2:
	/* The 4 words saved from the register save area at the target's
	 * sp are copied back to the target procedure's save area. The
	 * only point of this is to prevent a catastrophic failure in
	 * case the contents were moved by an alloca after calling
	 * setjmp. This is a bit paranoid but it doesn't cost much.
	 */

	l32i	a7, a2, 4		/* load the target stack pointer */
	addi	a7, a7, -16		/* find the destination save area */
	l32i	a4, a2, 48
	l32i	a5, a2, 52
	s32i	a4, a7, 0
	s32i	a5, a7, 4
	l32i	a4, a2, 56
	l32i	a5, a2, 60
	s32i	a4, a7, 8
	s32i	a5, a7, 12

	l32i	a4, a2, 68
	beqz	a4, 1f

	mov	a6, a2
	movi	a7, 1
.hidden __sigsetjmp_tail
	call4	__sigsetjmp_tail
1:
	movi	a2, 1
	movnez	a2, a3, a3
	retw
