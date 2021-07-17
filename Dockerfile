# set base image (host OS) | notebook-6.2.0
FROM jupyter/base-notebook:lab-3.0.11

# set env variables
ENV JUPYTER_ENABLE_LAB=yes

# set the working directory in the container
WORKDIR /home

# copy the dependencies file to the working directory
COPY requirements.txt .

USER root
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y git

# install dependencies
RUN pip install -r requirements.txt
RUN jupyter labextension install jupyterlab-plotly@4.14.3