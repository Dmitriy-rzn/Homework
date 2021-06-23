# 5.2. Системы управления виртуализацией

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований Преимущественно Windows based инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий
* Можно использовать любую систему по сути, к примеру VMware Hyper-V либо облачные провайдеры Azure AWS

Требуется наиболее производительное бесплатное opensource решение для виртуализации небольшой (20 серверов) инфраструктуры Linux и Windows виртуальных машин
* Тут выбор из Xen KVM, KVM проще в разворачивании Xen в администрировании.

Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows инфраструктуры 
* Можно использовать Hyper-V

Необходимо рабочее окружение для тестирование программного продукта на нескольких дистрибутивах Linux
* в принципе ту связку что мы используем в домашних заданиях vagrant и virtualbox быстро разорачивает машины и легко управляется.

2. Опишите сценарий миграции с VMware vSphere на Hyper-V для Linux и Windows виртуальных машин. Детально опишите необходимые шаги для использования всех преимуществ Hyper-V для Windows.

* Удаляем VMware Tools, конвертируем файл жёсткого диска виртуалки из формата VMDK в формат VHDX. Затем создаем в Hyper-V виртуальную машину с такими же параметрами оборудования, что былы в VMware и подключаем к ней сконвертированный образ жёсткого диска, по сути это основная задача.

3. Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был бы выбор, то создавали ли вы бы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.

* По моему мнению гетерогенная среда использоваться не должна, или если и используется то гипотетические плюсы от такого использования должны быть сильнее минусов, среди которых можно выделить:
```
разные форматы файлов виртуальных машин
все приложения или скрипты надо настраивать на рабу с разными гипервизорами
программы резервного копирования должны поддерживать все гипервизоры или под каждый свою, что увеличивает затраты
если гипервизоры коммерческие, обновление разных лицензий
```
