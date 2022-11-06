FROM debian:9.13

WORKDIR /tmp

RUN apt-get update -y \
&& apt-get -y install git wget curl gcc telnet build-essential libncurses5-dev g++ \
&& apt-get -y install autoconf autotools-dev make erlang \
&& apt-get -y install libexpat-dev libyaml-dev libssl-dev zlib1g-dev

CMD ["/bin/bash"]
