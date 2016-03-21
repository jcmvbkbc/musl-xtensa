#include "pthread_impl.h"
#include "libc.h"
#include <elf.h>

int __set_thread_area(void *p)
{
	__asm__ __volatile__ ("wur.threadptr %0" :: "r"(p) : "memory");
	return 0;
}
