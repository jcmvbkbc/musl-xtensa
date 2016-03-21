# __clone(func, stack, flags, arg, ptid, tls, ctid)
#         a2,   a3,    a4,    a5,  a6,   a7,  [sp]

# syscall(SYS_clone, flags, stack, ptid, tls, ctid)
#         a2,        a6,    a3,    a4,   a5,  a8

.global __clone
.type   __clone,@function
.align 4
__clone:
#if defined(__XTENSA_CALL0_ABI__)
	# align stack and save func,arg
	srli	a3, a3, 4
	slli	a3, a3, 4
	addi	a3, a3, -16
	s32i	a2, a3, 0
	s32i	a5, a3, 4

	# syscall
	mov	a2, a4
	mov	a4, a6
	mov	a6, a2
	mov	a5, a7
	l32i	a8, a1, 16
	movi	a2, 116 # SYS_clone
	syscall

	beqz	a2, 1f
	# parent
	ret

	# child
1:
	l32i	a0, a1, 0
	l32i	a2, a1, 4
#ifdef __FDPIC__
	l32i	a11, a0, 4
	l32i	a0, a0, 0
#endif
	callx0	a0
	mov	a6, a2
	movi	a2, 118 # SYS_exit
	syscall
#else
#error Unsupported Xtensa ABI
#endif
