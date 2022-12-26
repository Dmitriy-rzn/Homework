# 13.2 разделы и монтирование

Задание 1: подключить для тестового конфига общую папку

Перепишем конфиг из предыдущего задания для запуска в одном поде с общей папкой [test.yaml](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/test/test.yaml)

Создаем файл из контейнера backend и читаем его из контейнера frontend

![](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/1.JPG)

Задание 2: подключить общую папку для прода

Создаем манифесты [pv](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/pv.yaml) и [pvc](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/pvc.yaml) 

Добавляем в конфигурации [backend](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/prod/backend.yaml) и [frontend](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/prod/frontend.yaml) ссылки на диск

Создаем файл на backend и читаем его из frontend

![](https://github.com/Dmitriy-rzn/Homework/blob/main/13.2/2.JPG)
