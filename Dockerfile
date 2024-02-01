# Set to a lower version than the latest (3.13 as of 2023.11.17)
FROM python:3.12-alpine3.18

# alpine linux 용 python 관련 패키지
# 1. mysqlclient
RUN apk add gcc musl-dev mariadb-connector-c-dev

WORKDIR /app

COPY . .

# 1. install package
ARG INSTALL_COMMAND="pip install -r requirements.txt"
RUN ${INSTALL_COMMAND}

RUN sed -i 's/ALLOWED_HOSTS = \[]/ALLOWED_HOSTS = \["*"]/g' "$(find . -name settings.py)"

## 2. run with --app argument
ENV START_COMMAND="python manage.py runserver --noreload 0:8000"
ENTRYPOINT ${START_COMMAND}

## CC. infinity loop for docker container exec
#ENTRYPOINT while :; do echo 'Press <CTRL+C> to exit.'; sleep 1; done