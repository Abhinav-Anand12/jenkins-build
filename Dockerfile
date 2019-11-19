FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

WORKDIR /app

RUN mkdir -p /app/

COPY ./app /app

VOLUME ["/dockjenk"]

#ENV PYTHONPATH=/app
#
#EXPOSE 80

