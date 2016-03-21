.section .init
#ifdef __FDPIC__
	l32i	a12, sp, 4
#endif
	l32i	a0, sp, 0
	addi	sp, sp, 16
	ret

.section .fini
#ifdef __FDPIC__
	l32i	a12, sp, 4
#endif
	l32i	a0, sp, 0
	addi	sp, sp, 16
	ret
