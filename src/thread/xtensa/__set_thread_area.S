.global __set_thread_area
.type   __set_thread_area,@function
.align 4
__set_thread_area:
#ifdef __XTENSA_WINDOWED_ABI__
	entry	a1, 16
#endif
	wur	a2, threadptr
	movi	a2, 0
#if defined(__XTENSA_WINDOWED_ABI__)
	retw
#elif defined(__XTENSA_CALL0_ABI__)
	ret
#else
#error Unsupported Xtensa ABI
#endif
