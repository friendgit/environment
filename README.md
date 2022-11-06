## How to compile Ejabberd 14.12 from source codes.

### 1. Create Docker Image

Enter where this file is and execute command:

```
docker build \
  --platform linux/amd64 \
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

```

docker run -it --rm \
--platform linux/amd64 \
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