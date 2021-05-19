# 3.9. Элементы безопасности информационных систем

1. Запускаем vault server: vault server -dev -dev-listen-address 0.0.0.0:8200  

Далее все по инструкции в конечном итоге получаем несколько сертификатов из них нас интересуют cert.txt содержит все про наш сертификат для netology.example.com  
и intermediate.cert.pem промежуточный сертификат его мы добавили в trust-store и сделали update-ca-certificates  
в /etc/hosts добавляем наше имя
в nginx используется следующая конфигурация   
server {

    listen 443 ssl;
    server_name netology.example.com;
    ssl_certificate /etc/ssl/netology.crt;
    ssl_certificate_key /etc/ssl/netology.key;
}
ключи получил из файла cert.txt в итоге получаем успешное подключение, на скриншоте curl.png


