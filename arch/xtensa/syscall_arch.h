#define __SYSCALL_LL_E(x) \
((union { long long ll; long l[2]; }){ .ll = x }).l[0], \
((union { long long ll; long l[2]; }){ .ll = x }).l[1]
#define __SYSCALL_LL_O(x) 0, __SYSCALL_LL_E((x))

static inline long __syscall0(long n)
{
	register long a2 __asm__("a2") = n;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      :
			      : "memory");
	return a2;
}

static inline long __syscall1(long n, long a)
{
	register long a2 __asm__("a2") = n;
	register long a6 __asm__("a6") = a;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      : "a"(a6)
			      : "memory");
	return a2;
}

static inline long __syscall2(long n, long a, long b)
{
	register long a2 __asm__("a2") = n;
	register long a6 __asm__("a6") = a;
	register long a3 __asm__("a3") = b;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      : "a"(a6), "a"(a3)
			      : "memory");
	return a2;
}

static inline long __syscall3(long n, long a, long b, long c)
{
	register long a2 __asm__("a2") = n;
	register long a6 __asm__("a6") = a;
	register long a3 __asm__("a3") = b;
	register long a4 __asm__("a4") = c;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      : "a"(a6), "a"(a3), "a"(a4)
			      : "memory");
	return a2;
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
	register long a2 __asm__("a2") = n;
	register long a6 __asm__("a6") = a;
	register long a3 __asm__("a3") = b;
	register long a4 __asm__("a4") = c;
	register long a5 __asm__("a5") = d;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      : "a"(a6), "a"(a3), "a"(a4), "a"(a5)
			      : "memory");
	return a2;
}

static inline long __syscall5(long n, long a, long b, long c, long d, long e)
{
	register long a2 __asm__("a2") = n;
	register long a6 __asm__("a6") = a;
	register long a3 __asm__("a3") = b;
	register long a4 __asm__("a4") = c;
	register long a5 __asm__("a5") = d;
	register long a8 __asm__("a8") = e;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      : "a"(a6), "a"(a3), "a"(a4), "a"(a5), "a"(a8)
			      : "memory");
	return a2;
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
	register long a2 __asm__("a2") = n;
	register long a6 __asm__("a6") = a;
	register long a3 __asm__("a3") = b;
	register long a4 __asm__("a4") = c;
	register long a5 __asm__("a5") = d;
	register long a8 __asm__("a8") = e;
	register long a9 __asm__("a9") = f;

	__asm__ __volatile__ ("syscall"
			      : "+&a"(a2)
			      : "a"(a6), "a"(a3), "a"(a4), "a"(a5), "a"(a8), "a"(a9)
			      : "memory");
	return a2;
}

#define SYSCALL_FADVISE_6_ARG
