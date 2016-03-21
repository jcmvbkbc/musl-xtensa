.global __tlsdesc_static
.hidden __tlsdesc_static
.type __tlsdesc_static,@function
.align 4
__tlsdesc_static:
#ifdef __XTENSA_WINDOWED_ABI__
	entry	a1, 16
#endif
	rur	a3, threadptr
	add	a2, a2, a3
#if defined(__XTENSA_WINDOWED_ABI__)
	retw
#elif defined(__XTENSA_CALL0_ABI__)
	ret
#else
#error Unsupported Xtensa ABI
#endif

.hidden __tls_get_new

.global __tlsdesc_dynamic
.hidden __tlsdesc_dynamic
.type __tlsdesc_dynamic,@function
.align 4
__tlsdesc_dynamic:
#if defined(__XTENSA_WINDOWED_ABI__)
	entry	a1, 16
	mov	a6, a2
	call4	__tls_get_addr
	mov	a2, a6
	retw
#elif defined(__XTENSA_CALL0_ABI__)
	j	__tls_get_addr
#else
#error Unsupported Xtensa ABI
#endif
