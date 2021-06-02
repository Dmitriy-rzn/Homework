# 4.2. Использование Python для решения типовых DevOps задач

1. 1) ошибка типов 2) a='1' 3) a=1 b =2

2. 
```
 #!/usr/bin/env python3
import os

dir = "/home/vagrant/git/"
bash_command = ["cd "+dir, "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
prepare_result = ""
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = prepare_result + dir + result.replace('\tmodified:   ', '') + "\n"
print (prepare_result)
```

3. Проверяем ввод, если он меньше 2 символов, смотрим в текущей директории, если больше то по введенному пути
```
 #!/usr/bin/env python3
import os
import sys

def re (dir):
   bash_command = ["cd " +dir, "git status"]
   result_os = os.popen(' && '.join(bash_command)).read()
   is_change = False
   prepare_result = ""
   if result_os != "" and result_os.find("not a git repository") == -1:
       for result in result_os.split('\n'):
           if result.find('modified') != -1:
              prepare_result = prepare_result + dir + result.replace('\tmodified:   ', '') + "\n"
       print(prepare_result)
   else:
       print("Не является GIT репозиторием, укажите путь к репозиторию")

path = ""
if len(sys.argv) < 2:
  path = os.getcwd()
  re(path+"/")
else:
  path = sys.argv[1]
  re(path)

```
4. Проверяем наличие файла с предыдущими результатами, если нет создаем новый и записываем туда результаты проверки и выводим результат
```
import os
import socket
hosts = ["drive.google.com", "mail.google.com", "google.com"]
if os.path.exists("ip.txt"):
    with open("ip.txt", "r") as f:
        ipd = {}
        strs = f.read().split('\n')
        del strs[-1]
        for str in strs:
            host = str.split(" - ")[0]
            ip = str.split(" - ")[1]
            ipd[host] = ip
else:
    ipd = {"drive.google.com":"0.0.0.0", "mail.google.com":"0.0.0.0", "google.com":"0.0.0.0"}
out = ""
f = open("ip.txt", "w")
for host in hosts:
    ip = socket.gethostbyname(host)
    out = out + host + ' - ' + ip+"\n"
    if ipd[host] == ip:
        print(host + ' - ' + ip)
    else:
        print("[ВНИМАНИЕ] " + host + " IP изменился с : " + ipd[host] + " на " + ip)
f.write(out)
f.close()

```
