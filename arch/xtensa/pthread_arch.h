static inline struct pthread *__pthread_self()
{
	register char *tp;
	__asm__ __volatile__ ("rur %0, threadptr" : "=r" (tp));
	return (pthread_t)(tp + 8 - sizeof(struct pthread));
}

#define TLS_ABOVE_TP
#define TP_ADJ(p) ((char *)(p) + sizeof(struct pthread) - 8)

#define MC_PC sc_pc
