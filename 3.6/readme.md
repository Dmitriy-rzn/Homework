# 3.6. Компьютерные сети, лекция 1

1. Old Star Wars rulez !

2. Всего 14 каналов, но последний не используется, ширина канала 20 Мгц, непересекающихся канала 3 : 1, 6, 11
Для 5 ГГц надежно работают только 4 канала: 36/40/44/48 (для Европы, для США есть еще 5). На остальных включен режим сосуществования с радарами (DFS)

3. Имя компании:	Apple, Inc    Адрес компании:	1 Infinite Loop Cupertino CA 95014 US

4. Заголовки:Ethernet header/FCS – 26 байт, IFG – 12 байт, IPv4 – 20 байт, а TCP – 32 байта.   
Max TCP Payload= (MTU–TCP–IP) / (MTU+Ethernet+IFG) = (9100-32-20)/(9100+26+12)=99%, но судя по документации Ethernet MTU может быть 46 ~ 1500 байт и при 1500 максимальный MTU 94 %
9001-32-20=8949 байт

5. Не должен. Сочетание символов SYN и FIN, установленных в заголовке TCP, является незаконным и относится к категории нелегальных /ненормальных сочетаний флагов, 
поскольку оно требует как установления соединения (через SYN), так и завершения соединения (через FIN). Установка флагов SYN и FIN позволяет пакету пройти через статический фильтр пакетов, 
так как такие фильтры блокируют только SYN-пакеты. Однако если такой пакет поступит на открытый порт Windows или UNIX-системы, то в ответ будет отправлен SYN/ACK-пакет.

6. Мы смотрим вывод по UPD протоколу, UDP - это протокол без установления соединения. SS будет показывать только UCONN или ESTAB

7. Cостояния TCP соединения при завершении соединения: 
* Шаг 1 (FIN From Client) — Клиентское приложение решает, что хочет закрыть соединение. (сервер также может закрыть соединение). Это заставляет клиента отправлять сегмент TCP с битом FIN, установленным в 1, на сервер и переходить в состояние FIN_WAIT_1 . Находясь в состоянии FIN_WAIT_1 , клиент ожидает сегмента TCP от сервера с подтверждением (ACK).
* Шаг 2 (ACK от сервера) — Когда сервер получил сегмент битов FIN от отправителя (клиента), сервер немедленно отправляет сегмент подтверждения (ACK) отправителю (клиенту).
* Шаг 3 (ожидание клиента). Находясь в состоянии FIN_WAIT_1 , клиент ожидает сегмент TCP от сервера с подтверждением. Когда он получает этот сегмент, клиент входит в состояние FIN_WAIT_2 . Находясь в состоянии FIN_WAIT_2 , клиент ожидает от сервера другого сегмента с битом FIN, установленным в 1.
* Шаг 4 (FIN от Сервера) — Сервер отправляет сегмент бита FIN Отправителю (Клиенту) через некоторое время, когда Сервер отправляет сегмент ACK (из-за некоторого процесса закрытия на Сервере).
* Шаг 5 (ACK от клиента) — Когда клиент получает сегмент битов FIN с сервера, клиент подтверждает сегмент сервера и переходит в состояние TIME_WAIT . Состояние TIME_WAIT позволяет клиенту повторно отправить окончательное подтверждение в случае потери ACK. Время, проведенное клиентом в состоянии TIME_WAIT, зависит от их реализации, но их типичные значения — 30 секунд, 1 минута и 2 минуты. После ожидания соединение официально закрывается и все ресурсы на стороне клиента (включая номера портов и данные буфера) освобождаются.

8. Номер порта — это условное 16-битное число от 1 до 65535, указывающее, какой программе предназначается пакет. От одного клиента сервер может обслужить столько соединений, сколько портов в системе 
(если хватит производительности). Если клиентов несколько, то теоретически сервер, может на каждого из них обслужить 65535 соединений.

9. Думаю, что может быть, если открывается много короткоживущих соединений. Возможно перегрузить систему слишком большим количеством одновременно закрытых соединений, 
так как TIME_WAIT длится порядка нескольких минут и новое TCP соединение не получится открыть, пока не освободится сокет.

10. Если один фрагмент потерялся, датаграмма должна быть целиком повторно передана. TCP осуществляет тайм-аут и повторную передачу, UDP - нет. 
Когда потерялся фрагмент из TCP сегмента, TCP отработает тайм-аут и повторно передаст TCP сегмент целиком. 

11. По мне логи это информация, где важна точность и отсутствие потерь информации, следовательно TCP. syslog же использует TCP для самых важных логов и UDP для не особо важных.

12. На виртуалке в состоянии прослушивания находится 5 портов команда ss -t state listening либо ss -tal  

* State        Recv-Q       Send-Q               Local Address:Port                 Peer Address:Port       Process  
* LISTEN       0            4096                       0.0.0.0:sunrpc                    0.0.0.0:*
* LISTEN       0            4096                 127.0.0.53%lo:domain                    0.0.0.0:*
* LISTEN       0            128                        0.0.0.0:ssh                       0.0.0.0:*
* LISTEN       0            4096                          [::]:sunrpc                       [::]:*
* LISTEN       0            128                           [::]:ssh                          [::]:*

13. С опцией -A команда tcpdump будет отображать на экране содержимое пакетов в формате ASCII:  tcpdump -A  
С опцией -XX захватывает данные каждого пакета, включая его заголовки уровня канала, и выводит их на экран в шестнадцатеричном и ASCII форматах.

14. Флаг DF,  Ethernet II,  
OUI есть в дампе в первых трёх октетах MAC-адресов в скобочках  
 (52:54:00):12:35:02 > 08:00:27:14:86:db, 
 (08:00:27):14:86:db > 52:54:00:12:35:02, 
