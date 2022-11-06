FROM debian:8.8

WORKDIR /tmp

RUN apt-get update -y \
&& apt-get -y install git wget curl gcc \
&& apt-get -y install erlang autoconf autotools-dev make \
&& apt-get -y install libexpat-dev libyaml-dev libssl-dev zlib1g-dev

CMD ["/bin/bash"]