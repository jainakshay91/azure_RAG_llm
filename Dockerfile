FROM jupyter/scipy-notebook:latest
WORKDIR /home/jovyan/work
COPY ./requirements.txt .
RUN python3 -m pip install --no-cache -r requirements.txt

