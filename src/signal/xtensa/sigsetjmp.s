.global sigsetjmp
.global __sigsetjmp
.global ___sigsetjmp
.type sigsetjmp,%function
.type __sigsetjmp,%function
.type ___sigsetjmp,%function
.align 4
sigsetjmp:
__sigsetjmp:
	entry	a1, 16

___sigsetjmp:
	call4	__window_spill

	/* Copy the caller registers a0 - a3 at (sp - 16) to jmpbuf. */
	addi	a7, a1, -16
	l32i	a4, a7, 0
	l32i	a5, a7, 4
	s32i	a4, a2, 0
	s32i	a5, a2, 4
	l32i	a4, a7, 8
	l32i	a5, a7, 12
	s32i	a4, a2, 8
	s32i	a5, a2, 12

	/* Copy the caller registers a4-a8/a12 from the overflow area. */
	/* Entry moved the SP by 16 bytes, so SP of caller-1 is at (sp + 4). */
	extui	a7, a0, 30, 2
	blti	a7, 2, 2f
	l32i	a8, a1, 4	/* a8: SP of 'caller-1' */
	slli	a4, a7, 4
	sub	a6, a8, a4
	addi	a5, a2, 16
	addi	a8, a8, -16	/* a8: end of overflow area */
1:
	l32i	a7, a6, 0
	l32i	a4, a6, 4
	s32i	a7, a5, 0
	s32i	a4, a5, 4
	l32i	a7, a6, 8
	l32i	a4, a6, 12
	s32i	a7, a5, 8
	s32i	a4, a5, 12
	addi	a5, a5, 16
	addi	a6, a6, 16
	bltu	a6, a8, 1b
2:
	/* Copy caller-1 registers a0 - a3 (this is assuming entry a1, 16) */
	l32i	a4, a1, 0
	l32i	a5, a1, 4
	s32i	a4, a2, 48
	s32i	a5, a2, 52
	l32i	a4, a1, 8
	l32i	a5, a1, 12
	s32i	a4, a2, 56
	s32i	a5, a2, 60

	/* Save the return address, including the window size bits. */
	s32i	a0, a2, 64
	s32i	a3, a2, 68
	beqz	a3, 1f

	mov	a6, a2
	movi	a7, 0
.hidden __sigsetjmp_tail
	call4	__sigsetjmp_tail
1:
	movi	a2, 0
	retw
