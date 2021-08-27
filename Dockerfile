FROM mptrabalho/flask-dataviz:latest
LABEL maintainer="smartlab-dev@mpt.mp.br"

COPY requirements.txt /app/requirements.txt

RUN apt-get install -y g++ gcc gfortran libopenblas-dev liblapack-dev && \
    pip3 install -r /app/requirements.txt && \
    apt-get remove -y g++ gcc gfortran libopenblas-dev liblapack-dev && \
    apt-get clean

ENTRYPOINT ["sh", "/start.sh"]
