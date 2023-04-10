# syntax=docker/dockerfile:1

# We will use python:3.8-slim-buster as the base image for building the Flask container
FROM python:3.8-slim-buster
RUN python3 -m pip install Flask
RUN python3 -m pip freeze > requirements.txt
# copy the requirements file into the image
COPY . /app/requirements.txt

# It specifies the working directory where the Docker container will run
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN echo pip3 install -r requirements.txt
# Copying all the application files to the working directory
COPY . .
# Install all the dependencies required to run the Flask application
RUN pip install -r requirements.txt
# Add this ENV
ENV FLASK_APP=App.py
# Expose the Docker container for the application to run on port 5000
EXPOSE 5000
# The command required to run the Dockerized application
CMD ["python3", "/app/app.py", "-m", "flask"]