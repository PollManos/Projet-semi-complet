FROM python:3.11

WORKDIR	/monbay

COPY . .

CMD ["python3","app.py"]
