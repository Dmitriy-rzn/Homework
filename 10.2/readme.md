# 10.02. Системы мониторинга

1.   
push:  
* гибкость  
* можно использовать UDP  
* источних данных может быть закрыт для доступа извне  
к недостаткам можно отнести  
* с UDP могут быть ошибочные данные  
* контроль подлинности данных  
pull:  
* удобнее администрировать большое число однотипных источников данных и проверять достоверность  
недостатки  
* необходим доступ с центрального узла к каждому узлу, соответственно необходима повышенная безопасность центрального узла сбора данных  

2.   
  
Prometheus     -pull  
TICK 		-push  
Zabbix		-pull\push  
VictoriaMetrics -TSDB  
Nagios 		-push  

Скриншоты
пинги
![пинги](https://github.com/Dmitriy-rzn/Homework/blob/main/10.2/ping.PNG)   
диск
![диск](https://github.com/Dmitriy-rzn/Homework/blob/main/10.2/disk.PNG)
докер
![докер](https://github.com/Dmitriy-rzn/Homework/blob/main/10.2/docker.PNG)
