.global vfork
.type vfork,@function
vfork:
#if defined(__XTENSA_CALL0_ABI__)
	movi	a2, 116 # __NR_clone
	movi	a3, 0
	movi	a6, 0x4111 # CLONE_VM | CLONE_VFORK | SIGCHLD
	syscall

#ifdef __FDPIC__
.hidden __syscall_ret
	movi	a9, __syscall_ret@GOT
	add	a9, a9, a11
	l32i	a9, a9, 0
	jx	a9
#else
#error Unsupported Xtensa ABI
#endif
#else
#error Unsupported Xtensa ABI
#endif
