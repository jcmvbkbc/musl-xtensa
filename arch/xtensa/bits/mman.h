#define MAP_FAILED ((void *) -1)

#define	PROT_NONE      0
#define	PROT_READ      1
#define	PROT_WRITE     2
#define	PROT_EXEC      4
#define	PROT_GROWSDOWN 0x01000000
#define	PROT_GROWSUP   0x02000000

#define	MAP_SHARED     0x01
#define	MAP_PRIVATE    0x02
#define	MAP_FIXED      0x10

#define MAP_TYPE       0x0f
#undef MAP_FILE
#define MAP_FILE       0x00
#undef MAP_ANON
#define MAP_ANON       0x800
#define MAP_ANONYMOUS  MAP_ANON
#undef MAP_NORESERVE
#define MAP_NORESERVE  0x0400
#undef MAP_GROWSDOWN
#define MAP_GROWSDOWN  0x1000
#undef MAP_DENYWRITE
#define MAP_DENYWRITE  0x2000
#undef MAP_EXECUTABLE
#define MAP_EXECUTABLE 0x4000
#undef MAP_LOCKED
#define MAP_LOCKED     0x8000
#undef MAP_POPULATE
#define MAP_POPULATE   0x10000
#undef MAP_NONBLOCK
#define MAP_NONBLOCK   0x20000
#undef MAP_STACK
#define MAP_STACK      0x40000
#undef MAP_HUGETLB
#define MAP_HUGETLB    0x80000

#define POSIX_MADV_NORMAL       0
#define POSIX_MADV_RANDOM       1
#define POSIX_MADV_SEQUENTIAL   2
#define POSIX_MADV_WILLNEED     3
#define POSIX_MADV_DONTNEED     4

#define MS_ASYNC        1
#define MS_INVALIDATE   2
#define MS_SYNC         4

#define MCL_CURRENT     1
#define MCL_FUTURE      2

#if defined(_GNU_SOURCE) || defined(_BSD_SOURCE)
#define MADV_NORMAL      0
#define MADV_RANDOM      1
#define MADV_SEQUENTIAL  2
#define MADV_WILLNEED    3
#define MADV_DONTNEED    4
#define MADV_REMOVE      9
#define MADV_DONTFORK    10
#define MADV_DOFORK      11
#define MADV_MERGEABLE   12
#define MADV_UNMERGEABLE 13
#define MADV_HUGEPAGE    14
#define MADV_NOHUGEPAGE  15
#define MADV_DONTDUMP    16
#define MADV_DODUMP      17
#define MADV_HWPOISON    100
#endif
