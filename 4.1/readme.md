# 4.1. Командная оболочка Bash: Практические навыки

1. c=a+b записали в С строку, d=1+2 записали переменные но строкой, e=3 скобки указывают что а и b челочисленные переменные.

2. в скрипте не хватает скобки и условия выхода из цикла, можно изменить так  
```
 #!/bin/bash
while ((1))  
 do   
  curl https://localhost:4757  
 if (($? == 0))  
  then  
   echo "$(date)" "Хост доступен" >> curl.log  
  break  
  else  
   echo "$(date)" "Хост недоступен" >> curl.log  
  fi  
   sleep 10  
done  
```
так мы выйдем из условия при удачном курле и не так активно писать в лог неудачные попытки.

3.  
```
 #!/bin/bash
for ((i = 0 ; i <= 4 ; i++));
  do
    for host in 192.168.0.1 173.194.222.113 87.250.250.242
        do
                curl http://"$host":80 --max-time 1 1>/dev/null  2>/dev/null
                        if (($? == 0))
                                then
                                        echo "$(date) $host" "доступен" >> curl.log
                                else
                                        echo "$(date) $host" "недоступен" >> curl.log
                        fi
        done
done
```
4.   
```
while ((1))
do
        for host in 173.194.222.113 87.250.250.242 192.168.0.1
        do
                curl http://"$host":80 --max-time 1 1>/dev/null  2>/dev/null
                if (($? == 0))
                then
                        echo "$(date) $host" "доступен" >> curl.log
                else
                        echo "$(date) $host" "недоступен" >> error.log
                        exit 1
                fi
        done
done
```

