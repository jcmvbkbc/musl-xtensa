.global __syscall
.hidden __syscall
.type   __syscall,@function
.align 4
__syscall:
#ifdef __XTENSA_WINDOWED_ABI__
	entry	a1, 16
#endif
	mov	a8, a3
	mov	a3, a4
	mov	a4, a5
	mov	a5, a6
	mov	a6, a8
	mov	a8, a7
#if defined(__XTENSA_WINDOWED_ABI__)
	l32i	a9, a1, 16
	syscall
	retw
#elif defined(__XTENSA_CALL0_ABI__)
	l32i	a9, a1, 0
	syscall
	ret
#else
#error Unsupported Xtensa ABI
#endif
