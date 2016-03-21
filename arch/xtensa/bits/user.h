#define ELF_NGREG 128
#define ELF_NFPREG 18
typedef unsigned long elf_greg_t, elf_gregset_t[ELF_NGREG];
typedef unsigned int elf_fpreg_t, elf_fpregset_t[ELF_NFPREG];
