.global __syscall
.hidden __syscall
.type   __syscall,@function
.align 4
__syscall:
	mov	a8, a3
	mov	a3, a4
	mov	a4, a5
	mov	a5, a6
	mov	a6, a8
	mov	a8, a7
	l32i	a9, a1, 0
	syscall
	ret
