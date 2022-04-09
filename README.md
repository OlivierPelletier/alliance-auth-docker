# alliance-auth-docker

A docker setup for Alliance Auth.

## Cookbook
* ```docker build . -t opetdev/alliance-auth:1.0.0```
* Update config/local.py.
* (Optional) Update NGINX config files found in config/nginx
* Update MySQL default password in docker-compose.yml and db_setup.sql
* ```docker-compose up -d```
* (First setup) Login into Adminer (localhost:8080) and execute commands found in db_setup.sql
* Create superuser. ```docker exec -it alliance-auth-docker_alliance-auth_1 python /home/allianceserver/myauth/manage.py createsuperuser```
* (First setup) Redo ```docker-compose up -d```
