FROM mptrabalho/flask-dataviz:latest
LABEL maintainer="smartlab-dev@mpt.mp.br"

COPY requirements.txt /app/requirements.txt

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y g++ gcc gfortran libopenblas-dev liblapack-dev libsasl2-modules-gssapi-mit wget && \
    apt-get install -y krb5-user libkrb5-dev && \
    pip3 install -r /app/requirements.txt && \
    wget http://dl.cpp.la/Archive/hbase-thrift-0.20.4.patch.tgz && \
    tar -zxvf hbase-thrift-0.20.4.patch.tgz && \
    cd hbase-thrift-0.20.4.patch && \
    python3 setup.py install && \
    apt-get remove -y g++ gcc gfortran libopenblas-dev liblapack-dev  wget && \
    apt-get clean

ENTRYPOINT ["sh", "/start.sh"]
