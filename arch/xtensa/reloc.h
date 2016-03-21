#if __BYTE_ORDER == __BIG_ENDIAN
#define ENDIAN_SUFFIX "eb"
#else
#define ENDIAN_SUFFIX ""
#endif

#if __FDPIC__
#define ABI_SUFFIX "-fdpic"
#else
#define ABI_SUFFIX ""
#endif

#define LDSO_ARCH "xtensa" ENDIAN_SUFFIX ABI_SUFFIX

#define TPOFF_K 8

#define REL_PLT         R_XTENSA_JMP_SLOT
#define REL_RELATIVE    R_XTENSA_RELATIVE
#define REL_GOT         R_XTENSA_GLOB_DAT
#define REL_COPY        R_XTENSA_32
#define REL_TLSDESC     R_XTENSA_TLSDESC_FN

#if __FDPIC__
#define REL_FUNCDESC	R_XTENSA_FUNCDESC
#define REL_FUNCDESC_VAL R_XTENSA_FUNCDESC_VALUE

#define DL_FDPIC 1
#define DL_NOMMU_SUPPORT 1

#define CRTJMP(pc,sp) do { \
	register size_t a4 __asm__("a4") = ((size_t *)(sp))[-2]; \
	__asm__ __volatile__( "mov a1, %1 ; jx %0" \
	: : "r"(pc), "r"(sp), "r"(a4) : "memory" ); } while(0)

#define GETFUNCSYM(fp, sym, got) __asm__ ( \
	"movi %0, " #sym "@GOTOFFFUNCDESC ; add %0, %0, %1" \
	: "=&a"(*fp) : "a"(got) : "memory" )
#endif
