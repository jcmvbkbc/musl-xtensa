.global __unmapself
.type   __unmapself,@function
.align 4
__unmapself:
#if defined(__XTENSA_CALL0_ABI__)
	mov	a6, a2
	movi	a2, 81 # SYS_munmap
	syscall
	movi	a2, 118 # SYS_exit
	syscall
#else
#error Unsupported Xtensa ABI
#endif
