FROM centos:7.9.2009

WORKDIR /tmp/

RUN yum update -y \
&& yum install -y epel-release \
&& yum -y install git curl wget openssl dnf libyaml-devel glibc-devel pam-devel rsync sudo \
&& yum -y install expat-devel make automake autoconf nginx \
&& yum -y install openssl-devel unixODBC-devel ncurses-devel gcc gcc-c++ zlib-devel erlang


CMD ["/bin/bash"]