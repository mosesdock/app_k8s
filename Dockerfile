# syntax=docker/dockerfile:1
# start by pulling the python image
FROM python:3.8-slim-buster
RUN python3 -m pip install Flask
RUN python3 -m pip freeze > requirements.txt
# copy the requirements file into the image
COPY . /app/requirements.txt
# switch working directory
WORKDIR /app


# install the dependencies and packages in the requirements file
RUN echo pip3 install -r requirements.txt

# copy every content from the local file to the image
COPY . .
# Add this ENV
ENV FLASK_APP=App.py

CMD [ "python3", "app.py", "-m" , "flask", "run", "--host=0.0.0.0"]
