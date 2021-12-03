FROM python:3.10

WORKDIR /code

COPY  ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./entry_point.sh /entry_point.sh
RUN chmod +x /entry_point.sh
# COPY ./src /code/src

CMD ["sh","/entry_point.sh"]

