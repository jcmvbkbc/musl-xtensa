.global __tlsdesc_static
.hidden __tlsdesc_static
.type __tlsdesc_static,@function
.align 4
__tlsdesc_static:
	entry	a1, 16
	rur	a3, threadptr
	add	a2, a2, a3
	retw

.hidden __tls_get_new

.global __tlsdesc_dynamic
.hidden __tlsdesc_dynamic
.type __tlsdesc_dynamic,@function
.align 4
__tlsdesc_dynamic:
	entry	a1, 16
	mov	a6, a2
	call4	__tls_get_addr
	mov	a2, a6
	retw
