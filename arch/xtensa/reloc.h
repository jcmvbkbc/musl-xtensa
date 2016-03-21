#include <endian.h>

#if __BYTE_ORDER == __BIG_ENDIAN
#define ENDIAN_SUFFIX "eb"
#else
#define ENDIAN_SUFFIX ""
#endif

#define LDSO_ARCH "xtensa" ENDIAN_SUFFIX

#define TPOFF_K 8

#define REL_PLT         R_XTENSA_JMP_SLOT
#define REL_RELATIVE    R_XTENSA_RELATIVE
#define REL_GOT         R_XTENSA_GLOB_DAT
#define REL_COPY        R_XTENSA_32
#define REL_TPOFF       R_XTENSA_TLS_TPOFF
//#define REL_TLSDESC     R_XTENSA_TLSDESC_FN

#define CRTJMP(pc,sp) __asm__ __volatile__( \
	"movsp a1, %1 ; jx %0" : : "a"(pc), "a"(sp) : "memory" )
