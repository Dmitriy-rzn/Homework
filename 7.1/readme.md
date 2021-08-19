# 7.1. Инфраструктура как код

1. 

```
1. Думаю неизменяемая подойдет, будем уверены, что тест и дев прод среды совпадают
2. По идее единая точка управления и хранения конфигураций увеличивает возможность отказа системы, но в принципе возможно
3. Аансибл и терраформ работают без агентов в чем их несомненный плюс, из агентов возможен zabbix к примеру.
4. Предполагаю что использоватся будет Аnsible Terraform Kubernetes

```
```
Аnsible Terraform Kubernetes Docker
```
```
Как минимум мониторинг (zabbix + grafana) по идее еще бы работу с логами (Elasticsearch, Kibana, Logstash)
```

2. 
```
root@vagrant:/home/vagrant# terraform --version
Terraform v0.14.3

```
3. 

делаем отдельную папку, качаем туда терраформ 12 версии и делаем сим линк на него  

ln -s /home/vagrant/terraform/12/terraform /usr/bin/terraform12
chmod ugo+x /usr/bin/terraform12

```
root@vagrant:/home/vagrant/terraform/12# terraform --version
Terraform v0.14.3

root@vagrant:/home/vagrant/terraform/12# terraform12 --version
Terraform v0.12.20


```
