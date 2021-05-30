FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

#RUN apt-get update && \
#  apt-get install -y software-properties-common && \
#  add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update

#RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git
RUN apt-get install -y apt-utils vim curl apache2 apache2-utils
RUN apt-get -y install python3 libapache2-mod-wsgi-py3
RUN ln /usr/bin/python3 /usr/bin/python
RUN apt-get -y install python3-pip
RUN ln /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
RUN pip install django ptvsd
RUN apt-get install -y python3-venv
RUN pip install virtualenv

COPY . project/
WORKDIR project

RUN virtualenv venv
SHELL ["/bin/bash", "-c"]
RUN . venv/bin/activate && pip install -r requirements.txt


EXPOSE 8000





