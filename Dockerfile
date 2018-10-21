FROM ubuntu:latest

ENV SLUGIFY_USES_TEXT_UNIDECODE=yes
ENV AIRFLOW_HOME=~/airflow

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y python3-pip \
  && pip3 install apache-airflow \
  && airflow initdb \
  && airflow webserver -p 8080 \
  && airflow scheduler 

WORKDIR /root

# Define default command.
CMD ["bash"]

