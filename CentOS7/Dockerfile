FROM centos:7.9.2009

WORKDIR /tmp/

RUN yum update -y \
&& yum install -y epel-release \
&& yum -y install git curl wget openssl dnf libyaml-devel glibc-devel pam-devel rsync sudo \
&& yum -y install openssl-devel unixODBC-devel ncurses-devel gcc gcc-c++ zlib-devel erlang \
&& yum -y install expat-devel make automake autoconf nginx


CMD ["/bin/bash"]