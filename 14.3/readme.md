# 14.3 Карты конфигураций

### Как создать карту конфигураций?

```
kubectl create configmap nginx-config --from-file=nginx.conf
kubectl create configmap domain --from-literal=name=netology.ru
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/1.JPG)

### Как просмотреть список карт конфигураций?

```
kubectl get configmaps
kubectl get configmap
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/2.JPG)

### Как просмотреть карту конфигурации?

```
kubectl get configmap nginx-config
kubectl describe configmap domain
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/3.JPG)

### Как получить информацию в формате YAML и/или JSON?

```
kubectl get configmap nginx-config -o yaml
kubectl get configmap domain -o json
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/4.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/4.5.JPG)
### Как выгрузить карту конфигурации и сохранить его в файл?

```
kubectl get configmaps -o json > configmaps.json
kubectl get configmap nginx-config -o yaml > nginx-config.yml
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/5.JPG)

### Как удалить карту конфигурации?

```
kubectl delete configmap nginx-config
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/6.JPG)

### Как загрузить карту конфигурации из файла?

```
kubectl apply -f nginx-config.yml
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.3/7.JPG)
