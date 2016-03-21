// __syscall_cp_asm(&self->cancel, nr, u, v, w, x, y, z)
//                  a2             a3  a4 a5 a6 a7 [sp] [sp+4]

// syscall(nr, u, v, w, x, y, z)
//         a2  a6 a3 a4 a5 a8 a9

.global __cp_begin
.hidden __cp_begin
.global __cp_end
.hidden __cp_end
.global __cp_cancel
.hidden __cp_cancel
.hidden __cancel
.global __syscall_cp_asm
.hidden __syscall_cp_asm
.type __syscall_cp_asm,%function
.align 4
__syscall_cp_asm:
	entry	a1, 16
__cp_begin:
	l32i	a2, a2, 0
	bnez	a2, __cp_cancel
	mov	a2, a4
	mov	a4, a6
	mov	a6, a2
	mov	a2, a3
	mov	a3, a5
	mov	a5, a7
	l32i	a8, a1, 16
	l32i	a9, a1, 20
	syscall
__cp_end:
	retw
__cp_cancel:
	call4	__cancel
	mov	a2, a6
	retw
