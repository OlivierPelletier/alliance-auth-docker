FROM ubuntu:20.04
RUN apt update
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt -y install sudo python3.8 python3.8-dev python3.8-venv python3-pip libmysqlclient-dev unzip git redis-server curl libssl-dev libbz2-dev libffi-dev supervisor

RUN adduser --disabled-login allianceserver
USER allianceserver

ENV VIRTUAL_ENV=/home/allianceserver/venv/auth/
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m pip install wheel
RUN python3 -m pip install allianceauth
RUN python3 -m pip install gunicorn
RUN python3 -m pip install django-eveuniverse
RUN python3 -m pip install aa-moonmining

WORKDIR /home/allianceserver

RUN allianceauth start myauth

USER root

RUN ln -s /home/allianceserver/myauth/supervisor.conf /etc/supervisor/conf.d/myauth.conf
RUN mkdir -p /var/www/myauth/static
RUN chown -R allianceserver:allianceserver /home/allianceserver/myauth
RUN chown -R allianceserver:allianceserver /var/www/myauth/static

RUN usermod -aG sudo allianceserver
RUN echo "allianceserver ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/allianceserver

USER allianceserver

WORKDIR /home/allianceserver/myauth

COPY start_aa.sh /home/allianceserver/start_aa.sh

CMD sh /home/allianceserver/start_aa.sh
