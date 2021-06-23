# 5.3. Контейнеризация на примере Docker

1. Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование докера? Или лучше подойдет виртуальная машина, физическая машина? Или возможны разные варианты?"

* Высоконагруженное монолитное java веб-приложение;
виртуальную машину или физический сервер, Докер не очень подходит для высоконагруженных монолитных приложений.
* Go-микросервис для генерации отчетов;
докер для микросервисов самое то
* Nodejs веб-приложение
докер должен подойти если не высоконагруженное приложение
* Мобильное приложение c версиями для Android и iOS;
виртуальная машина, т.к. с докером вопрос неоднозначный под IOS он вроде не очень работает с мобильными приложениями
* База данных postgresql используемая, как кэш;
виртуальнуя машина, т.к. не очень понимаю как данная база используется
* Шина данных на базе Apache Kafka;
Cудя по статьям в интернете в докере работает
* Очередь для Logstash на базе Redis;
можно в докере
* Elastic stack для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
По идее докер можно, но у нас используются просто виртуальные машины
* Мониторинг-стек на базе prometheus и grafana;
можно в докере
* Mongodb, как основное хранилище данных для java-приложения;
Лучше использовать физический сервер, но можно поробовать виртуальный
* Jenkins-сервер.
Можно использовать докер

2. Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на докерхаб-репо.
 
* docker run -d --name dmi -p 8091:80 dmitryrzn/docker
https://hub.docker.com/r/dmitryrzn/netology-h
* использовался проброс на виртуальную машину port.png поэтому на index.png порт 8071

3. 

* docker run -d -ti --name centos -v /home/vagrant/info:/share/info centos
* docker run -d -ti --name debian -v /home/vagrant/info:/info debian
```
root@vagrant:/home/vagrant/info# docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
34c061e7147a   debian    "bash"        About a minute ago   Up About a minute             debian
3ca35d1fca36   centos    "/bin/bash"   6 minutes ago        Up 6 minutes                  centos
root@vagrant:/home/vagrant/info# docker exec -ti centos touch /share/info/cent1
root@vagrant:/home/vagrant/info# docker exec -ti debian touch /info/deb2
root@vagrant:/home/vagrant/info# touch home3
root@vagrant:/home/vagrant/info# docker exec -ti debian ls /info/
cent1  deb2  home3
root@vagrant:/home/vagrant/info#
```
