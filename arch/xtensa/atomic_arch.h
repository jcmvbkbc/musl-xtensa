#include "bits/xtensa-config.h"

#if XCHAL_HAVE_S32C1I
#define a_cas a_cas
static inline int a_cas(volatile int *p, int t, int s)
{
	__asm__ __volatile__ (
		"	wsr	%2, scompare1\n"
		"	s32c1i	%0, %1\n"
		: "+a"(s), "+m"(*p)
		: "a"(t)
		: "memory" );
        return s;
}
#endif

#define a_barrier a_barrier
static inline void a_barrier()
{
	__asm__ __volatile__ ("memw" : : : "memory");
}

#define a_crash a_crash
static inline void a_crash()
{
	__asm__ __volatile__ ("ill" : : : "memory");
}
