FROM mptrabalho/flask-dataviz:latest
LABEL maintainer="smartlab-dev@mpt.mp.br"

COPY requirements.txt /app/requirements.txt

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y g++ gcc gfortran libopenblas-dev liblapack-dev && \
    apt-get install -y krb5-user && \
    pip3 install -r /app/requirements.txt && \
    apt-get remove -y g++ gcc gfortran libopenblas-dev liblapack-dev && \
    apt-get clean

ENTRYPOINT ["sh", "/start.sh"]
