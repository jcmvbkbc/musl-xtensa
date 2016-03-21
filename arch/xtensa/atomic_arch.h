#ifndef _INTERNAL_ATOMIC_H
#define _INTERNAL_ATOMIC_H

#include <stdint.h>

#define a_cas a_cas
static inline int a_cas(volatile int *p, int t, int s)
{
	__asm__ __volatile__(
		"	wsr	%1, scompare1\n"
		"	s32c1i	%0, %2, 0\n"
		: "+a"(s)
		: "a"(t), "a"(p)
		: "memory" );
        return s;
}

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

#endif
