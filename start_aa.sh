#!/bin/bash
python3 /home/allianceserver/myauth/manage.py migrate --noinput
python3 /home/allianceserver/myauth/manage.py collectstatic --noinput
python3 /home/allianceserver/myauth/manage.py check
yes "y" | python3 /home/allianceserver/myauth/manage.py moonmining_load_eve
sudo supervisord -c /etc/supervisor/supervisord.conf
celery -A myauth call moonmining.tasks.run_calculated_properties_update
gunicorn --bind 0.0.0.0 myauth.wsgi
