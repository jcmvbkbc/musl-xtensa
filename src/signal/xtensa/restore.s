.global __restore
.global __restore_rt
.type __restore,@function
.type __restore_rt,@function
.space 1
.align 4
__restore:
__restore_rt:
	movi	a2, 225 # SYS_rt_sigreturn
	syscall
