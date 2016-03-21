struct semid_ds {
	struct ipc_perm sem_perm;
#if __BYTE_ORDER == __LITTLE_ENDIAN
	unsigned long __sem_otime_lo;
	unsigned long __sem_otime_hi;
	unsigned long __sem_ctime_lo;
	unsigned long __sem_ctime_hi;
#else
	unsigned long __sem_otime_hi;
	unsigned long __sem_otime_lo;
	unsigned long __sem_ctime_hi;
	unsigned long __sem_ctime_lo;
#endif
	unsigned long sem_nsems;
	long __unused3;
	long __unused4;
	time_t sem_otime;
	time_t sem_ctime;
};
