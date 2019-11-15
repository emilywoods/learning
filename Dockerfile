FROM python:3.7-slim

COPY app.py /
COPY requirements.txt /

RUN pip install -r requirements.txt

CMD [ "python", "./app.py" ]
