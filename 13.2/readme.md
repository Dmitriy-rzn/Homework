# 13.2 разделы и монтирование

Задание 1: подключить для тестового конфига общую папку

Перепишем конфиг из предыдущего задания для запуска в одном поде с общей папкой [test.yaml](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/test/test.yaml)

Создаем файл из контейнера backend и читаем его из контейнера frontend

![](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/1.JPG)

Задание 2: подключить общую папку для прода

Создаем манифесты pv и pvc 

Добавляем в конфигурации backend и frontend ссылки на диск

Создаем файл на backend и читаем его из frontend

![](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/2.JPG)
