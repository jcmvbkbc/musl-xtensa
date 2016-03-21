.global __tlsdesc_static
.hidden __tlsdesc_static
.type __tlsdesc_static,@function
.align 4
__tlsdesc_static:
	l32i		a2, a2, 4
	rur.threadptr	a3
	add		a2, a2, a3
	ret

.global __tlsdesc_dynamic
.hidden __tlsdesc_dynamic
.type __tlsdesc_dynamic,@function
.align 4
__tlsdesc_dynamic:
	l32i		a2, a2, 4	# a2 = &{modidx, off}
	rur.threadptr	a3
	addi		a3, a3, -4
	l32i		a3, a3, 0	# a3 = dtv
	l32i		a4, a2, 0	# a4 = modidx
	addx4		a3, a4, a3
	l32i		a3, a3, 0	# a3 = dtv[modidx]
	l32i		a2, a2, 4
	add		a2, a2, a3	# a2 = dtv[modidx] + off
	ret
