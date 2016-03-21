#if __FDPIC__
#define ABI_SUFFIX "-fdpic"
#else
#define ABI_SUFFIX ""
#endif

#define LDSO_ARCH "xtensa" ABI_SUFFIX

#define TPOFF_K 0

#define REL_PLT         R_XTENSA_JMP_SLOT
#define REL_GOT         R_XTENSA_GLOB_DAT

#if __FDPIC__
#define REL_SYMBOLIC	R_XTENSA_SYM32
#define REL_TPOFF	R_XTENSA_TLS_TPOFF
#define REL_TLSDESC	R_XTENSA_TLSDESC
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
