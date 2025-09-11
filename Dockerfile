# FROM python:3.11-slim

# WORKDIR /app

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "portfolio_project.wsgi:application"]

# ====================================================================================================================



# Use official Python image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y libpq-dev gcc

# Copy requirements.txt first (for caching)
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project code
COPY . /app/

# Collect static files (Django)
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000

# Run server using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "portfolio_project.wsgi:application"]
