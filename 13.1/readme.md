# 13.1 контейнеры, поды, deployment, statefulset, services, endpoints

Задание 1: подготовить тестовый конфиг для запуска приложения

Сделан конфиг [test](https://github.com/Dmitriy-rzn/Homework/blob/main/13.1/Test/test.yaml) для запуска в одном деплойменте фронтенда и бэканда, описан сервис.

Отдельно создаем БД через statefulset [bd](https://github.com/Dmitriy-rzn/Homework/blob/main/13.1/Test/db.yaml)

Вывод результата:

![result 1.png](https://github.com/Dmitriy-rzn/Homework/blob/main/13.1/result%201.JPG)

Задание 2: подготовить конфиг для production окружения

Конфиги фронтенда и бэкэнда разделены [Prod](https://github.com/Dmitriy-rzn/Homework/tree/main/13.1/Prod)

Вывод результата:

![result 2.png](https://github.com/Dmitriy-rzn/Homework/blob/main/13.1/result%202.JPG)

