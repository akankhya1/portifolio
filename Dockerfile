# FROM python:3.11-slim

# WORKDIR /app

# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "portfolio_project.wsgi:application"]

# ====================================================================================================================



# Use official Python image
# FROM python:3.11-slim

# # Set working directory inside container
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y libpq-dev gcc

# # Copy requirements.txt first (for caching)
# COPY requirements.txt /app/

# # Install Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy project code
# COPY . /app/

# # Collect static files (Django)
# RUN python manage.py collectstatic --noinput

# # Expose port
# EXPOSE 8000

# # Run server using Gunicorn
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "portfolio_project.wsgi:application"]

# ===================================================================================================


# FROM python:3.11-slim

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y libpq-dev gcc --no-install-recommends && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# COPY requirements.txt /app/
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy project code
# COPY . /app/

# # Expose port
# EXPOSE 8000

# # Default command → overridden by docker-compose
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "portfoilo_project.wsgi:application"]



# ==============================================================================================================




FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y libpq-dev gcc --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project code
COPY . /app/

# Expose port
EXPOSE 8000

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
