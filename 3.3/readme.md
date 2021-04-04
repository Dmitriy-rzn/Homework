По второму пункту
из вывода strace нашел только программа вот этот кусок,
открывает свой конфигурационный файл и файл содержащий сигнатуры
openat(AT_FDCWD, "/etc/magic", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=111, ...}) = 0
read(3, "# Magic local data for file(1) c"..., 4096) = 111
read(3, "", 4096)                       = 0
close(3)                                = 0
openat(AT_FDCWD, "/usr/share/misc/magic.mgc", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=5811536, ...}) = 0
mmap(NULL, 5811536, PROT_READ|PROT_WRITE, MAP_PRIVATE, 3, 0) = 0x7ffb8f91e000
close(3)   
смотрим на файл и видим, что это файл, содержащий магические числа.
file -L /usr/share/misc/magic.mgc
/usr/share/misc/magic.mgc: magic binary file for file(1) cmd (version 14) (little endian)

третий пункт
uname({sysname="Linux", nodename="vagrant", ...}) = 0
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0), ...}) = 0
uname({sysname="Linux", nodename="vagrant", ...}) = 0
uname({sysname="Linux", nodename="vagrant", ...}) = 0
write(1, "Linux vagrant 5.4.0-58-generic #"..., 105) = 105