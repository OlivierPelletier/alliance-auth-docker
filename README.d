# alliance-auth-docker

A docker setup for Alliance Auth.

## Cookbook
* ```docker build . -t opetdev/alliance-auth:1.0.0```
* Update config/local.py.
* (Optional) Update NGINX config files found in config/nginx
* Update MySQL default password in docker-compose.yml
* ```docker-compose up -d```
* (First setup) Login into Adminer (localhost:8080) and execute commands found in db_setup.sql
* (First setup) Redo ```docker-compose up -d```
