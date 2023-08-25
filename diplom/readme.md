# Дипломный практикум в Yandex.Cloud

---
## Цели:
1. Подготовить облачную инфраструктуру на базе облачного провайдера Яндекс.Облако.
2. Запустить и сконфигурировать Kubernetes кластер.
3. Установить и настроить систему мониторинга.
4. Настроить и автоматизировать сборку тестового приложения с использованием Docker-контейнеров.
5. Настроить CI для автоматической сборки и тестирования.
6. Настроить CD для автоматического развёртывания приложения.

## Подготовить облачную инфраструктуру

> Ожидаемые результаты:
>
> Terraform сконфигурирован и создание инфраструктуры посредством Terraform возможно без дополнительных ручных действий.
> Полученная конфигурация инфраструктуры является предварительной, поэтому в ходе дальнейшего выполнения задания возможны изменения.
### Решение
Проверяем версию терраформа
```
vagrant@vagrant:~/netology-diplom$ terraform version
Terraform v1.5.5
on linux_amd64
```
Создаем рабочее пространство stage

```
vagrant@vagrant:~/netology-diplom/terraform$ terraform workspace list
  default
* stage
```
Создаем сервисный аккаунт и бакет

[diplom/terraform](https://github.com/Dmitriy-rzn/Homework/tree/main/diplom/terraform)

Указываем переменные для упрощения работы полученные на предыдущем шаге
```
export AWS_ACCESS_KEY_ID=<Значение `key_id`>
export AWS_SECRET_ACCESS_KEY=<Значение `secret`>
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/diplom-bucket2.JPG)

Проверяем что в яндекс хранилище появился файл tfstate

![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/tfstate.jpg)


## Запустить и сконфигурировать Kubernetes кластер

> Ожидаемый результат:
>
> Работоспособный Kubernetes кластер.
> 
> В файле ~/.kube/config находятся данные для доступа к кластеру.
> Команда kubectl get pods --all-namespaces отрабатывает без ошибок.

### Решение

Создаем будущий кластер Kubernetes в пространстве stage

[Kubernetes](https://github.com/Dmitriy-rzn/Homework/tree/main/diplom/kubernetes)

Обявляем наше хранилище в файле provider.tf

[provider.tf](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/kubernetes/terraform/provider.tf)

Запускаем cluster_install.sh, скрипт разворачивает конфигурацию, получает приватные и публичные IP, подготавливает файл hosts.ini, затем закидывает это все в kuberspray и ансиблом разворачивает кластер Kubernetes, в конце создает файл admin.conf c внешним IP мастера для подключения к кластеру с локальной машины.

![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/cloud.JPG)

![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/Pods.JPG)


## Создание тестового приложения

> Ожидаемый результат:

> Git репозиторий с тестовым приложением и Dockerfile.
> Регистр с собранным docker image. В качестве регистра может быть DockerHub или Yandex Container Registry, созданный также с помощью terraform.

### Решение

Подготовим тестовое приложение состоящие из вэб странички с информацией о студенте.
https://github.com/Dmitriy-rzn/Homework/tree/main/diplom/webapp/html
Докер файл для создания образа
https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/webapp/dockerfile

Контейнеризируем данное веб-приложение с помощью Docker используя образ веб-сервера Nginx и запушим в DockerHub ссылка на image
https://hub.docker.com/repository/docker/dmitryrzn/web/general
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/dockerhub.JPG)



## Подготовка cистемы мониторинга и деплой приложения

> Ожидаемый результат:

> Git репозиторий с конфигурационными файлами для настройки Kubernetes.
> Http доступ к web интерфейсу grafana.
> Дашборды в grafana отображающие состояние Kubernetes кластера.
> Http доступ к тестовому приложению.

## Установка и настройка CI/CD

> Ожидаемый результат:

> Интерфейс ci/cd сервиса доступен по http.
> При любом коммите в репозиторие с тестовым приложением происходит сборка и отправка в регистр Docker образа.
> При создании тега (например, v1.0.0) происходит сборка и отправка с соответствующим label в регистр, а также деплой соответствующего Docker образа в кластер Kubernetes.










