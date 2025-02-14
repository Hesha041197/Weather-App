# Use an official Python runtime as a parent image
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY app.py requirements.txt /app/
COPY templates/ /app/templates/
COPY static/ /app/static/

# Install required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the application runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
