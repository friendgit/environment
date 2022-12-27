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


## How to set up the en in a fresh env.


### 1. Checkout environment repository.

```
git clone https://github.com/friendgit/environment.git
```

#### 2. Build centos7_vm image
```
cd environment/CentOS7

docker build \
  -t centos7_vm  \
  -f Dockerfile .
```


#### 3. Build hbase_vm image
```
cd Hbase

docker build \
  -t hbase_vm  \
  -f Dockerfile .
  
 
```

### 4. Start Hbase Docker

```
 docker run  -d \
 --name hbase \
 -p 9090:9095 \
 -p 2181:2181 \
 -p 60000:60000 \
 -p 60010:60010 \
 -p 60020:60020 \
 -p 60030:60030 \
 hbase_vm  
 
```

### 5. Enter Hbase docker and start thrift

```
docker exec -it hbase /bin/bash
cd bin/
./hbase-daemon.sh start thrift
```

### 6. Prepare a public domain and its SSL certifications for the server.

The detail of how to register a public domain, point it to the server the command in step 7 will be run.

Apply SSL certification for the domain.

Combine the SSL's public key and private key into a server.pem file. We need the server.pem file in later step.

### 7. Checkout mobifriends-chatxmpp repository.

```
git clone https://github.com/friendgit/mobifriends-chatxmpp.git
```

```
cd mobifriends-chatxmpp

docker run -d \
--name im \
-p 5280:5280 \
-p 5443:5443 \
-p 5222:5222 \
-p 5223:5223 \
-v $PWD:$PWD \
-w $PWD \
centos7_vm /bin/bash
```

Enter the im docker.
```
docker exec -it im /bin/bash

cd ejabberd-14.12

./autogen.sh 

./configure

make 

make install
```


### 8. Copy the server.pem file(Generated in step 6) im docker's /etc/ejabberd/ssl/ folder.

### 9. Copy mobifriends-chatxmpp/etc/ejabberd/ejabberd.yml file into im docker's /etc/ejabberd folder.

### 10. Copy mobifriends-chatxmpp/lib/ejabberd folder into im docker's /lib/.

### 11. Start Ejabberd inside the docker.

```
docker exec -it im /bin/bash

ejabberdctl start
```

### 12. Use command's to check the TLS support.

```
nmap --script ssl-enum-ciphers -p 5443 #DOMAIN#
```
Replace #DOMAIN# with the one you have registered in step 6.