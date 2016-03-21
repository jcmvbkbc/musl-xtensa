.section .init
.global  _init
.type    _init, @function
_init:
	entry	a1, 32

.section .fini
.global  _fini
.type    _fini, @function
_fini:
	entry	a1, 32
