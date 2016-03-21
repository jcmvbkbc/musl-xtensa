#if defined(__XTENSA_CALL0_ABI__)
typedef unsigned long __jmp_buf[6];
#else
#error Unsupported Xtensa ABI
#endif
