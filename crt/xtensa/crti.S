.section .init
.global  _init
.type    _init, @function
_init:
#if defined(__XTENSA_CALL0_ABI__)
	addi	sp, sp, -16
	s32i	a0, sp, 0
#ifdef __FDPIC__
	s32i	a12, sp, 4
	mov	a12, a11
#endif
#else
#error Unsupported Xtensa ABI
#endif

.section .fini
.global  _fini
.type    _fini, @function
_fini:
#if defined(__XTENSA_CALL0_ABI__)
	addi	sp, sp, -16
	s32i	a0, sp, 0
#ifdef __FDPIC__
	s32i	a12, sp, 4
	mov	a12, a11
#endif
#else
#error Unsupported Xtensa ABI
#endif
