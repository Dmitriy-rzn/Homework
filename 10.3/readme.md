# 10.03. Grafana

1.   

![datasource](https://github.com/Dmitriy-rzn/Homework/blob/main/10.3/data%20sources.PNG)

2.   
CPU  

(((count(count(node_cpu_seconds_total) by (cpu))) - avg(sum by (mode)(irate(node_cpu_seconds_total{mode='idle'}[5m])))) * 100) / count(count(node_cpu_seconds_total) by (cpu))  

CPULA 1/5/15  

avg(node_load1) /  count(count(node_cpu_seconds_total) by (cpu)) * 100  
avg(node_load5) /  count(count(node_cpu_seconds_total) by (cpu)) * 100  
avg(node_load15) /  count(count(node_cpu_seconds_total) by (cpu)) * 100  

Количество свободной оперативной памяти  

100 * (1 - ((avg_over_time(node_memory_MemFree_bytes[5m]) + avg_over_time(node_memory_Cached_bytes[5m]) + avg_over_time(node_memory_Buffers_bytes[5m])) / avg_over_time(node_memory_MemTotal_bytes[5m])))  

Количество места на файловой системе  

node_filesystem_free_bytes{fstype=~"ext4|xfs"} / node_filesystem_size_bytes{fstype=~"ext4|xfs"}

![dash](https://github.com/Dmitriy-rzn/Homework/blob/main/10.3/dash.PNG)  

3.   

![alerts](https://github.com/Dmitriy-rzn/Homework/blob/main/10.3/alerts.PNG)  

4.   

https://github.com/Dmitriy-rzn/Homework/blob/main/10.3/dashboard.json

