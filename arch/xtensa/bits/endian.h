#if __XTENSA_EB__
#define __BYTE_ORDER __BIG_ENDIAN
#elif __XTENSA_EL__
#define __BYTE_ORDER __LITTLE_ENDIAN
#else
#error Unknown endianness
#endif
