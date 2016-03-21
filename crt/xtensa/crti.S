.section .init
.global  _init
.type    _init, @function
_init:
	addi	sp, sp, -16
	s32i	a0, sp, 0
#ifdef __FDPIC__
	s32i	a12, sp, 4
	mov	a12, a11
#endif

.section .fini
.global  _fini
.type    _fini, @function
_fini:
	addi	sp, sp, -16
	s32i	a0, sp, 0
#ifdef __FDPIC__
	s32i	a12, sp, 4
	mov	a12, a11
#endif
