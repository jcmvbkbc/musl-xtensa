#ifdef __FDPIC__

__asm__(
".text \n"
".global " START " \n"
START ": \n"
"	.begin	no-transform\n"
"	call0	1f\n"
"2:\n"
"	.end	no-transform\n"
"	.align	4\n"
"	.literal_position\n"
"1:\n"
"	movi	a15, 2b\n"
"	sub	a15, a0, a15\n"

"	mov	a12, a4\n"
"	mov	a13, a5\n"
"	mov	a14, a6\n"
#ifndef SHARED
"	mov	a2, a4\n"
"	movi	a3, __ROFIXUP_LIST__\n"
"	add	a3, a3, a15\n"
"	movi	a4, __ROFIXUP_END__\n"
"	add	a4, a4, a15\n"
"	movi	a0, __fdpic_fixup\n"
"	add	a0, a0, a15\n"
"	callx0	a0\n"
"	mov	a11, a2\n"
"	s32i	a15, a11, 12\n"
#endif
"	addi	a7, a1, -8\n"
"	s32i	a12, a7, 0\n"
"	s32i	a13, a7, 4\n"
"	mov	a2, a1\n"
"	mov	a3, a14\n"
"	movi	a4, -16\n"
"	and	a1, a7, a4\n"
"	movi	a0, "START"_c\n"
"	add	a0, a0, a15\n"
"	callx0	a0\n"
);

#ifndef SHARED
#include "fdpic_crt.h"
#endif

#endif
