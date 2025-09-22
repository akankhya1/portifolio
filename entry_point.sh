

#!/bin/sh
set -e

echo "Running migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting Gunicorn..."
exec gunicorn --bind 0.0.0.0:8000 portfoilo_project.wsgi:application --env DJANGO_SETTINGS_MODULE=portfoilo_project.settings.prod
