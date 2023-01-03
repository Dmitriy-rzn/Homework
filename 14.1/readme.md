# 14.1 Создание и использование секретов

### Как создать секрет?
```
openssl genrsa -out cert.key 4096
openssl req -x509 -new -key cert.key -days 3650 -out cert.crt \
-subj '/C=RU/ST=Moscow/L=Moscow/CN=server.local'
kubectl create secret tls domain-cert --cert=certs/cert.crt --key=certs/cert.key
```
### Как просмотреть список секретов?
```
kubectl get secrets
kubectl get secret
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/1.JPG)

### Как просмотреть секрет?
```
kubectl get secret domain-cert
kubectl describe secret domain-cert
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/2.JPG)

### Как получить информацию в формате YAML и/или JSON?
```
kubectl get secret domain-cert -o yaml
kubectl get secret domain-cert -o json
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/3.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/3.5.JPG)

### Как выгрузить секрет и сохранить его в файл?
```
kubectl get secrets -o json > secrets.json
kubectl get secret domain-cert -o yaml > domain-cert.yml
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/4.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/4.5.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/5.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/5.5.JPG)

### Как удалить секрет?
```
kubectl delete secret domain-cert
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/6.JPG)

### Как загрузить секрет из файла?
```
kubectl apply -f domain-cert.yml
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.1/7.JPG)
