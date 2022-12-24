## How to compile Ejabberd 14.12 from source codes.

### 1. Create Docker Image

Enter where this file is and execute command:

If you are using Apple Silicon CPU, use the command:

```
docker build \
  --platform linux/amd64 \
  -t centos7_vm  \
  -f Dockerfile .
  
  
  docker build \
  --platform linux/amd64 \
  -t hbase_vm  \
  -f Dockerfile .
```

If you are NOT using Apple Silicon CPU, use the command:

```
docker build \
  -t build_vm  \
  -f Dockerfile .
```


The above command will create an Docker image and install the libs needed for compile Ejabberd 14.12.


### 2. Check out source codes

Clone Ejabberd repository and checkout to v14.12 branch

```
git clone https://github.com/friendgit/ejabberd.git

cd ejabberd

git checkout v14.12
```

### 3. Compile

In ejabberd's folder, execute commands:


If you are using Apple Silicon CPU, use the command:

```
docker run -itd \
--name im \
 --network mobifriend-network \
--platform linux/amd64 \
-p 5280:5280 \
-p 5222:5222 \
-v $PWD:$PWD \
-w $PWD \
centos7_vm /bin/bash
```


If you are NOT using Apple Silicon CPU, use the command:

```
docker run -it --rm \
-v $PWD:$PWD \
-w $PWD \
build_vm /bin/bash
```

In the docker env, execute commands:

```
./autogen.sh 

./configure

make
```


## REF

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=746073


## HBase

Enter HBase folder, execute:

```
docker build \
  --platform linux/amd64 \
  -t hbase_vm  \
  -f Dockerfile .

```

Start Hbase VM.

```
 docker run  -d \
 --network mobifriend-network \
 --name hbase \
 --platform linux/amd64 \
 -p 9090:9095 \
 -p 2181:2181 \
 -p 60000:60000 \
 -p 60010:60010 \
 -p 60020:60020 \
 -p 60030:60030 \
 hbase_vm
```

#### start 
ctn hbase


cd bin/

./hbase-daemon.sh start thrift

## Nginx 



```
 docker run  -d \
 --network mobifriend-network \
 --name nginx \
 --rm \
 --platform linux/amd64 \
 -p 8080:80 \
 -v /Users/peter/Documents/MobiFriends/git/environment/nginx/config:/etc/nginx/conf.d \
 -v /Users/peter/Documents/MobiFriends/git/chatxmpp/cliente:/usr/share/nginx/html/mobifriend \
 nginx:1.21.0
```




## Issues 

https://github.com/processone/ejabberd/issues/1778