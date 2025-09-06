FROM python:3.10-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y git curl ffmpeg python3-pip

WORKDIR /app

COPY requirements.txt .

RUN pip3 install wheel
RUN pip3 install --no-cache-dir -U -r requirements.txt

COPY . .

EXPOSE 5000

CMD flask run -h 0.0.0.0 -p 5000 & python3 main.py
