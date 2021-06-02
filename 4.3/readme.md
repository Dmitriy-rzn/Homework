# 4.3. Языки разметки JSON и YAML

1. Исправление json 
```
{ "info" : "Sample JSON output from our service \t",
    "elements" :[
        {
        "name" : "first",
        "type" : "server",
        "ip" : "7175"
        },
        {
        "name" : "second",
        "type" : "proxy",
        "ip" : "71.78.22.43"
        }
    ]
}
```
2. 
```
import os
import socket
import json
import yaml
def txt(file):
    hosts = ["drive.google.com", "mail.google.com", "google.com"]
    if os.path.exists(file):
        with open(file, "r") as f:
            ipd = {}
            strs = f.read().split('\n')
            del strs[-1]
            for str in strs:
                host = str.split(" - ")[0]
                ip = str.split(" - ")[1]
                ipd[host] = ip
    else:
        ipd = {"drive.google.com":"0.0.0.0", "mail.google.com":"0.0.0.0", "google.com":"0.0.0.0"}
    out = ""
    with open(file, "w") as f:
       for host in hosts:
            ip = socket.gethostbyname(host)
            out = out + host + ' - ' + ip + "\n"
            if ipd[host] == ip:
                 print(host + ' - ' + ip)
            else:
                 print("[ВНИМАНИЕ] " + host + " IP изменился с : " + ipd[host] + " на " + ip)
            f.write(out)
def js(file):
    hosts = ["drive.google.com", "mail.google.com", "google.com"]
    if os.path.exists(file):
        with open(file, "r") as f:
           ip_js = json.load(f)
    else:
        ip_js = {"drive.google.com": "0.0.0.0", "mail.google.com": "0.0.0.0", "google.com": "0.0.0.0"}
    f = open(file, "w")
    for host in hosts:
        ip = socket.gethostbyname(host)
        if ip_js[host] == ip:
            print(host + ' - ' + ip)
        else:
            print("[ВНИМАНИЕ] " + host + " IP изменился с : " + ip_js[host] + " на " + ip)
            ip_js[host] = ip
    json.dump(ip_js, f)
    f.close()
def ya(file):
    hosts = ["drive.google.com", "mail.google.com", "google.com"]
    if os.path.exists(file):
        with open(file, "r") as f:
            ip_ya = yaml.safe_load(f)
    else:
        ip_ya = {"drive.google.com": "0.0.0.0", "mail.google.com": "0.0.0.0", "google.com": "0.0.0.0"}
    f = open(file, "w")
    for host in hosts:
        ip = socket.gethostbyname(host)
        if ip_ya[host] == ip:
            print(host + ' - ' + ip)
        else:
            print("[ВНИМАНИЕ] " + host + " IP изменился с : " + ip_ya[host] + " на " + ip)
            ip_ya[host] = ip
    yaml.dump(ip_ya, f)
    f.close()

txt("ip.txt")
js("IP.json")
ya("IP.yaml")

```


