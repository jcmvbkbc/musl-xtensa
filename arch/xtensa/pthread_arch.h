static inline uintptr_t __get_tp()
{
	uintptr_t tp;
	__asm__ __volatile__ ("rur.threadptr %0" : "=a" (tp));
	return tp;
}

#define TLS_ABOVE_TP
#define GAP_ABOVE_TP 8

#define MC_PC sc_pc
