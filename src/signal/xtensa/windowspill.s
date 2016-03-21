#include <bits/xtensa-config.h>

#ifdef __XTENSA_WINDOWED_ABI__
.global __window_spill
.type   __window_spill, @function
.align  4
__window_spill:
	entry	a1, 48
	bbci.l	a0, 31, .L4		/* branch if called with call4 */
	bbsi.l	a0, 30, .L12		/* branch if called with call12 */

	/* Called with call8: touch register NUM_REGS-12 (4/20/52) */
.L8:
#if XCHAL_NUM_AREGS > 16
	call12	1f
	retw

	.align	4
1:	_entry	a1, 48			/* touch NUM_REGS-24 (x/8/40) */

#if XCHAL_NUM_AREGS == 32
	mov	a8, a0
	retw
#else
	mov	a12, a0
	_entry	a1, 48			/* touch NUM_REGS-36 (x/x/28) */
	mov	a12, a0
	_entry	a1, 48			/* touch NUM_REGS-48 (x/x/16) */
	mov	a12, a0
	_entry	a1, 16			/* touch NUM_REGS-60 (x/x/4) */
#endif
#endif
	mov	a4, a0
	retw

	/* Called with call4: touch register NUM_REGS-8 (8/24/56) */
.L4:
#if XCHAL_NUM_AREGS == 16
	mov	a8, a0
#else
	call12	1f
	retw

	.align	4
1:	_entry	a1, 48			/* touch NUM_REGS-20 (x/12/44) */
	mov	a12, a0
#if XCHAL_NUM_AREGS > 32
	_entry	a1, 48			/* touch NUM_REGS-32 (x/x/32) */
	mov	a12, a0
	_entry	a1, 48			/* touch NUM_REGS-44 (x/x/20) */
	mov	a12, a0
	_entry	a1, 48			/* touch NUM_REGS-56 (x/x/8) */
	mov	a8, a0
#endif
#endif
	retw

	/* Called with call12: touch register NUM_REGS-16 (x/16/48) */
.L12:
#if XCHAL_NUM_AREGS > 16
	call12	1f
	retw

	.align	4
1:	_entry	a1, 48			/* touch NUM_REGS-28 (x/4/36) */
#if XCHAL_NUM_AREGS == 32
	mov	a4, a0
#else
	mov	a12, a0
	_entry	a1, 48			/* touch NUM_REGS-40 (x/x/24) */
	mov	a12, a0
	_entry	a1, 48			/* touch NUM_REGS-52 (x/x/12) */
	mov	a12, a0
#endif
#endif
	retw

#endif
