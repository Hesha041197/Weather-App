# Define build arguments (only available during build time)
ARG IMAGE_NAME=weather-app
ARG IMAGE_TAG=latest

# Use an official Python runtime as a parent image
FROM python:slim

# Set static labels using build-time ARG (proper syntax)
ARG IMAGE_NAME
ARG IMAGE_TAG
LABEL name=${IMAGE_NAME} version=${IMAGE_TAG}

# Convert ARG to ENV so it persists at runtime
ENV IMAGE_NAME=${IMAGE_NAME}
ENV IMAGE_TAG=${IMAGE_TAG}

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Install required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the application runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
