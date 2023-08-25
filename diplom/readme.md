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

Подготовим тестовое приложение состоящие из вэб странички с информацией о студенте. [html](https://github.com/Dmitriy-rzn/Homework/tree/main/diplom/webapp/html)

Докер файл для создания образа. [dockerfile](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/webapp/dockerfile)

Контейнеризируем данное веб-приложение с помощью Docker используя образ веб-сервера Nginx и запушим в DockerHub ссылка на image
https://hub.docker.com/repository/docker/dmitryrzn/web/general

![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/dockerhub.JPG)



## Подготовка cистемы мониторинга и деплой приложения

> Ожидаемый результат:

> Git репозиторий с конфигурационными файлами для настройки Kubernetes.
> Http доступ к web интерфейсу grafana.
> Дашборды в grafana отображающие состояние Kubernetes кластера.
> Http доступ к тестовому приложению.

### Решение
Для установки воспользуемся Helm (создаем неймспейс, устанавливаем пакет прометеус).
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/helm-grafana.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/helm-grafana-pods.JPG)


Для доступа извне создаем [grafana.yml](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/prom-graf/grafana.yml) с пробросом. 


![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/grafana.JPG)

Логин/Пароль
admin prom-operator

http://158.160.121.79:32000/d/efa86fd1d0c121a26444b636a3f509a8/kubernetes-compute-resources-cluster?orgId=1&refresh=10s
http://158.160.121.79:32000

#### Установка приложения

Воспользуемся Helm создаем папку файлами основных настроек [web-app](https://github.com/Dmitriy-rzn/Homework/tree/main/diplom/webapp/web-app)
и установим наше приложение.

![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/web-app.JPG)

## Установка и настройка CI/CD

> Ожидаемый результат:

> Интерфейс ci/cd сервиса доступен по http.
> При любом коммите в репозиторие с тестовым приложением происходит сборка и отправка в регистр Docker образа.
> При создании тега (например, v1.0.0) происходит сборка и отправка с соответствующим label в регистр, а также деплой соответствующего Docker образа в кластер Kubernetes.

### Решение
Для решения задачи выбрал GitLab в нем у нас были задания в течении курса, к тому же выбор GitLab сэкономил время на развертывания своих инстансов.
[GitLab Интерфейс ci/cd](https://gitlab.com/netology754634/diplom)

Подружим GitLab и наш Kubernetes, с помощью Helm устанавливаем на кластер агент и раннер, раннер в процессе исследований погиб и был переставлен заново.

![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/agent-run.JPG)

Далее в GitLab проект, были загружены Dockerfile и index.html для сборки приложения. [файлы](https://gitlab.com/netology754634/diplom)

Создан файл [.gitlab-ci.yml](https://gitlab.com/netology754634/diplom/-/blob/main/.gitlab-ci.yml?ref_type=heads) c этапами build и deploy, и файл [deployment.yaml](https://gitlab.com/netology754634/diplom/-/blob/main/appdeploy/deployment.yaml?ref_type=heads) с описанием приложения, текущие настройки запускают билд при любом коммите в репозитории и билд и деплой если создали таг.
Демонстрация работы:
Изменяем тэг в файле index.html на 0.0.5
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/Gitlab-index.JPG)
Видим, что прошел билд образа без деплоя, 
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/Gitlab-index-tag-pipe.JPG)
затем создаем новый тэг 0.0.5, 
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/Gitlab-index-tag.JPG)
проходит билд и деплой
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/Gitlab-index-tag-pipe1.JPG)
идем в наш кластер Kubernetes видим новый созданный pod 
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/kuber-pod-1.JPG)
Заходим в него и curl`ом видим что в нем обновленное приложение
![](https://github.com/Dmitriy-rzn/Homework/blob/main/diplom/kuber-pod.JPG)

## Заключение

Таким образом в представленной работе рассмотрен, сильно упрощенный, но полный цикл автоматизации разработки программного продукта.















