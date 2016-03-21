.global __unmapself
.type   __unmapself,%function
.align 4
__unmapself:
	entry	a1, 16
	mov	a6, a2
	movi	a2, 81 # SYS_munmap
	syscall
	movi	a2, 118 # SYS_exit
	syscall
