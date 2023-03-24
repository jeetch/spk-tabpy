FROM python:3.7-slim-buster

RUN apt-get update \
    && apt-get install -y build-essential python3-dev \
    && pip install tabpy \
    && mkdir -p /opt/tabpy

WORKDIR /opt/tabpy
COPY tabpy.conf .
COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 9004

CMD ["tabpy", "serve", "--config", "tabpy.conf", "--port", "9004", "--no-ssl"]
