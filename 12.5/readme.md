# 12.5 Сетевые решения CNI

Кластер развернут kubespray, Calico в нем уже по умолчанию

Задание 1 : Создаем несколько делойментов hello-world на базе network-multitool

![deployments-pods.jpg](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/deployments-pods.JPG)

Применяем политики [permit](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/permit.yaml) и [deny](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/deny.yaml)

![networkpolicies.JPG](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/networkpolicies.JPG)

Создаем service для наших deployment, а затем curl-ом проверяем доступность

![результат.JPG](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82.JPG)

Задание 2 : 

Вывод требуемых команд

![](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/1.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/12.5/2.JPG)

