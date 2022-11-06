FROM debian:10.13

WORKDIR /tmp

ENV KERL_REPO=https://github.com/kerl/kerl.git \
    KERL_TAG=2.5.1  \
    OTP_VERSION=19.3.6.13  / 18.3.4.11

RUN apt-get update -y \
&& apt-get -y install git wget curl gcc telnet build-essential libncurses5-dev g++ \
&& apt-get -y install autoconf autotools-dev make \
&& apt-get -y install libexpat-dev libyaml-dev libssl-dev zlib1g-dev \
&& git clone --branch ${KERL_TAG} ${KERL_REPO} \
&& chmod a+x kerl \
&& mv kerl /usr/bin \
&& kerl update releases \
&& kerl build ${OTP_VERSION} ${OTP_VERSION} \
&& kerl install ${OTP_VERSION} /opt/erlang/${OTP_VERSION} \
&& echo ". /opt/erlang/${OTP_VERSION}/activate" >> /etc/bashrc \
&& export PATH=/opt/erlang/${OTP_VERSION}/bin:${PATH}

CMD ["/bin/bash"]
