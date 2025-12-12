FROM python:3-alpine

RUN pip install websockify

CMD websockify 6081 ${HOST_IP}:${HOST_PORT}