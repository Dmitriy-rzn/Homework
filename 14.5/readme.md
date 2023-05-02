# Troubleshooting

1. Установить приложение по команде: kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml

2. Выявить проблему и описать.
![1](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/1.JPG)
При установке получаем ошибку с namespaces, у нас нет web и data 
![2](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/2.JPG)

3. Исправить проблему, описать, что сделано.

Внесены изменения в yaml файл, добавлены nsmespaces 

[task2.yaml](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/task2.yaml)

![3](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/3.JPG)
![4](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/4.JPG)
![5](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/5.JPG)

Проверим логи пода web-consumer: kubectl logs web-consumer-85cccb47d4-84qjj -n web

![6](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/6.JPG)

Тестируем подключение nginx c пода web, не работает.

kubectl -n web exec web-consumer-85cccb47d4-84qjj  -- curl auth-db

![7](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/7.JPG)

Пробуем тоже самое, но явно указав data 

kubectl -n web exec web-consumer-85cccb47d4-84qjj  -- curl auth-db.data

![8](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/8.JPG)

 Вносим изменение в деплоймент [task2-1.yaml](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/task2-1.yaml)
 
- while true; do curl auth-db.data; sleep 5; done

![9](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/9.JPG)

Проверяем логи kubectl logs web-consumer-685c85f94-2lmrx -n web --tail 25
пошли обращения

![10](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/10.JPG)

4. Продемонстрировать, что проблема решена.
Итоговые выводы и логи

![11](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/11.JPG)

 kubectl -n web logs web-consumer-685c85f94-2lmrx --tail 25
 
![10](https://github.com/Dmitriy-rzn/Homework/blob/main/14.5/10.JPG)

kubectl -n web describe pod web-consumer-685c85f94-2lmrx

```
Name:             web-consumer-685c85f94-2lmrx
Namespace:        web
Priority:         0
Service Account:  default
Node:             worker2/172.28.128.30
Start Time:       Sun, 30 Apr 2023 12:24:12 +0000
Labels:           app=web-consumer
                  pod-template-hash=685c85f94
Annotations:      cni.projectcalico.org/containerID: e14dbc165d03028d24e553f1fa36714e126824746a1e089e7ff176d8718bff8f
                  cni.projectcalico.org/podIP: 10.233.125.13/32
                  cni.projectcalico.org/podIPs: 10.233.125.13/32
Status:           Running
IP:               10.233.125.13
IPs:
  IP:           10.233.125.13
Controlled By:  ReplicaSet/web-consumer-685c85f94
Containers:
  busybox:
    Container ID:  containerd://be3618d7383f482e82b86a6cdbc0da98c48a27e167ece1c571faee58f473487e
    Image:         radial/busyboxplus:curl
    Image ID:      sha256:4776f1f7d1f625c8c5173a969fdc9ae6b62655a2746aba989784bb2b7edbfe9b
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do curl auth-db.data; sleep 5; done
    State:          Running
      Started:      Sun, 30 Apr 2023 12:24:13 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-d25r6 (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-d25r6:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  12m   default-scheduler  Successfully assigned web/web-consumer-685c85f94-2lmrx to worker2
  Normal  Pulled     12m   kubelet            Container image "radial/busyboxplus:curl" already present on machine
  Normal  Created    12m   kubelet            Created container busybox
  Normal  Started    12m   kubelet            Started container busybox
```



