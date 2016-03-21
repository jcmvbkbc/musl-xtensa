.global __set_thread_area
.type   __set_thread_area,@function
.align 4
__set_thread_area:
	entry	a1, 16
	wur	a2, threadptr
	movi	a2, 0
	retw
