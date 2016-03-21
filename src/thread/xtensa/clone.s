// __clone(func, stack, flags, arg, ptid, tls, ctid)
//         a2,   a3,    a4,    a5,  a6,   a7,  [sp]

// syscall(SYS_clone, flags, stack, ptid, tls, ctid)
//         a2,        a6,    a3,    a4,   a5,  a8

.global __clone
.type   __clone,%function
.align 4
__clone:
	entry	a1, 16
	// align stack and save func,arg
	srli	a3, a3, 4
	slli	a3, a3, 4
	addi	a3, a3, -16
	s32i	a2, a3, 0
	s32i	a5, a3, 4

	// syscall
	mov	a2, a4
	mov	a4, a6
	mov	a6, a2
	mov	a5, a7
	l32i	a8, a1, 16
	movi	a2, 116 # SYS_clone
	syscall

	beqz	a2, 1f
	// parent
	retw

	// child
1:
	movi	a0, 0
	l32i	a4, a1, 0
	l32i	a6, a1, 4
	callx4	a4
	movi	a2, 118 # SYS_exit
	syscall
