FROM python:3-alpine

WORKDIR /code

COPY  ./requirements.txt /code/requirements.txt

RUN apk update && apk add --no-cache postgresql-dev gcc python3-dev musl-dev g++ && \
  pip install --no-cache-dir --upgrade -r /code/requirements.txt && \
  apk del gcc python3-dev musl-dev g++

COPY ./entry_point.sh /entry_point.sh
RUN chmod +x /entry_point.sh
# COPY ./src /code/src

CMD ["sh","/entry_point.sh"]

