FROM python:3.8-slim
RUN mkdir /appl
WORKDIR ./appl
RUN pip install --trusted-host pypi.python.org Flask
EXPOSE 80
ENV NAME=Earth
CMD ["python","app.py"]