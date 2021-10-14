# 08.02 Работа с Playbook


=======
1. Использовал два хоста на убунту 172.28.128.10 запускал ансибл и 172.28.128.20 под Elastic and Kiban   

Чет как то невнимательно прочитал задание и сделал загрузку Java с интернета вместо локального хранилища, но все работает.  

Запускаемся:  

ansible-playbook -i inventory/prod.yml --ask-pass --ask-become-pass site.yml  

Первый запуск:
![Первый запуск](https://github.com/Dmitriy-rzn/Homework/blob/main/8.2/first.png)

Второй запуск:
![Второй запуск](https://github.com/Dmitriy-rzn/Homework/blob/main/8.2/second.png)

На хосте с Elastic and Kibana
elasticsearch -d -p pid && kibana

Log:
![Log](https://github.com/Dmitriy-rzn/Homework/blob/main/8.2/Log.png)
>>>>>>> 75325466dd1690a2a64e2fed38514e0ec5ac54b7

