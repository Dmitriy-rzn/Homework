# Обновление приложений


1. Выбрать стратегию обновления приложения и описать ваш выбор. 
```
При заданных начальных условиях, на мой взгляд подходящей стратегией будет Rolling, при доступном пуле ресурсов 20% можно делать по одному поду за раз. 
Согласно стратегии, постепенно, один за другим, заменяем pod'ы со старой версией приложения на pod'ы с новой версией — без простоя кластера.
Kubernetes дожидается готовности новых pod'ов к работе (проверяя их с помощью readiness-тестов), прежде чем приступить к сворачиванию старых.
При наших услових отдельно необходимо донастроить работу в виде работы только с одним подом единовременно.
```

2. Обновить приложение.

#### Создать deployment приложения с контейнерами nginx и multitool. Версию nginx взять 1.19. Кол-во реплик - 5.
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/pods.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/deploy.JPG)
#### Обновить версию nginx в приложении до версии 1.20, сократив время обновления до минимума. Приложение должно быть доступно.
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update1.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update1-2.JPG)
#### Попытаться обновить nginx до версии 1.28, приложение должно оставаться доступным.
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update2.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update2-1.JPG)
#### Откатиться после неудачного обновления.
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update_rollback.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update_rollback-1.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.4/update_rollback-2.JPG)
