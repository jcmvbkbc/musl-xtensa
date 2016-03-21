.global dlsym
.hidden __dlsym
.type dlsym,@function
dlsym:
	mov	a4, a0
	j	__dlsym
