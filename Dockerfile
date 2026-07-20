FROM python:3.14-slim

WORKDIR /monapp

COPY . .

CMD ["python3","app.py"]
