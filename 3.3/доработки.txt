Добрый день.
1)похоже на то что использовался системный вызов chdir
stat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=4096, ...}) = 0
chdir("/tmp")                           = 0

3)создаем файл в который постоянно что то пишется, допустим cat /dev/random > 1.txt
затем  ps -aux | grep cat находим PID процесса 
ls -lh /proc/157110/fd видим что наш вывод перенаправлен в
l-wx------ 1 root root 64 Apr  3 14:48 1 -> /home/vagrant/1.txt
затем rm 1.txt 
l-wx------ 1 root root 64 Apr  3 14:48 1 -> '/home/vagrant/1.txt (deleted)'
lsof | grep deleted
cat  157110  root  1w REG  253,0  18  2884948 /home/vagrant/1.txt (deleted)
в дальнейшем любые действия с файлом не освобождают свободное место на диске
к примеру echo > /proc/157110/fd/1 покажет что файл обнулен
cat 157110  root  1w  REG 253,0   1  2884948 /home/vagrant/1.txt (deleted)
но при следующей записи в файл мы видим что объем не уменьшился и продолжает расти
cat 157110  root  1w  REG 253,0  48  2884948 /home/vagrant/1.txt (deleted)
после снятия процесса cat файл пропал.
вывод: пока процесс не отпустит удаленный файл сделать мы с ним ничего не сможем.

6)uname 
системный вызов 
execve("/usr/bin/uname", ["uname", "-a"], 0x7ffd216e0e18 /* 24 vars */) = 0
запускающий программу «/usr/bin/uname», с аргументом «-a»
затем вызов access узнающий есть ли такой файл
и так далее пока не доходим до попытки открыть библиотеки от которых зависит Uname
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3

8)set -o pipefail Этот параметр предотвращает маскировку ошибок в конвейере. 
Если какая-либо команда в конвейере терпит неудачу, этот код возврата будет 
использоваться как код возврата всего конвейера. 
По умолчанию код возврата конвейера - это код последней команды, даже если она выполнена успешно.
9)я в ответе и написал про дополнительные буквы, вывод был следующий
Ss  
R+
ответ
 s    is a session leader
 +    is in the foreground process group
Основные заглавные
 S    interruptible sleep (waiting for an event to complete
 R    running or runnable (on run queue)
