# 5.4. Практические навыки работы с Docker

1. https://hub.docker.com/repository/docker/dmitryrzn/ponys

* docker run pony

```
FROM archlinux:latest
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
   curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
   bsdtar -C / -xvf "$patched_glibc"
RUN pacman -Sy --noconfirm ponysay

ENTRYPOINT ["/usr/bin/ponysay"]
CMD ["Hey, netology”]

```

2. скриншоты ver* и ver*_web
* ver1  
https://hub.docker.com/repository/docker/dmitryrzn/amazonjen

```
FROM amazoncorretto:latest

ADD https://pkg.jenkins.io/redhat-stable/jenkins.repo /etc/yum.repos.d/
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
   yum install -y jenkins
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]

```

* ver2  
https://hub.docker.com/repository/docker/dmitryrzn/ubjen

```
FROM ubuntu:latest
ADD https://pkg.jenkins.io/debian-stable/jenkins.io.key /
RUN apt-get update && \
    apt-get install -y gnupg ca-certificates && \
    apt-key add /jenkins.io.key && \
    sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y openjdk-11-jdk jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
```
3. 


```
FROM node
ADD https://github.com/simplicitesoftware/nodejs-demo/archive/master.zip /
RUN apt-get update && \
    unzip master.zip && \
    cd /nodejs-demo-master
WORKDIR "/nodejs-demo-master"
RUN npm install
EXPOSE 3000
CMD ["npm", "start", "0.0.0.0"]
```


```
root@vagrant:/home/vagrant/doker/node# docker network ls
NETWORK ID     NAME          DRIVER    SCOPE
5a3f44547a32   bridge        bridge    local
5808224b8c6c   host          host      local
63bbcd2fe814   nodejs-demo   bridge    local
d6f7aae1e5c1   none          null      local
```


```
root@vagrant:/home/vagrant/doker/node# docker network inspect nodejs-demo
[
    {
        "Name": "nodejs-demo",
        "Id": "63bbcd2fe8147a19bc9c23c7df0124ecfe1016483a8ca2b31c99d16712bcfbe0",
        "Created": "2021-07-05T11:30:42.078800744Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "7ea3709a0c68343eea33b71ba609ef726d50bf41e18556079cbb8ba650257432": {
                "Name": "ubuntu_3000",
                "EndpointID": "7c9641a03c8833b73a5379d281d704ee55699e0b100f1467cfc63506c2733614",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            },
            "ce0c2bb08712006d7ab44e337c6e2e1b25b4bf2c0e71f9ec59d7be063f2b0f6e": {
                "Name": "nodejs-demo_3000",
                "EndpointID": "bcc109e21a4a8e438392236bf43b52a3c270abaff3afb339bb1ef14a632c9a44",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```
