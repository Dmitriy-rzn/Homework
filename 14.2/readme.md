# 14.2 Синхронизация секретов с внешними сервисами. Vault

Cоздал под с Vault c помощью vault-pod.yml, получили значение внутреннего IP и токена.

![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.2/1.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.2/2.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.2/2.5.JPG)

Поднял pod на базе fedora, установил в него python, попробовал подключиться к Vault, записал и прочитал секрет, использовав токен и ip полученные ранее:
```
import hvac
client = hvac.Client(url='http://10.233.125.2:8200',token='aiphohTaa0eeHei')
client.is_authenticated()
```
```
client.secrets.kv.v2.create_or_update_secret(path='hvac',secret=dict(Secret='Happy New Year'),)
```
```
 client.secrets.kv.v2.read_secret_version(path='hvac',)
```
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.2/3.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.2/4.JPG)
![](https://github.com/Dmitriy-rzn/Homework/blob/main/14.2/5.JPG)
