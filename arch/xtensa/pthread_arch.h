static inline uintptr_t __get_tp()
{
	uintptr_t tp;
	__asm__ __volatile__ ("rur %0, threadptr" : "=a" (tp));
	return tp;
}

#define TLS_ABOVE_TP
#define GAP_ABOVE_TP 8

#define MC_PC sc_pc
