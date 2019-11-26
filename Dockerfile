FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

WORKDIR /app

RUN mkdir -p /app/
RUN pip install email-validator --upgrade pip

COPY ./app /app

VOLUME ["/dockjenk"]

EXPOSE 80


