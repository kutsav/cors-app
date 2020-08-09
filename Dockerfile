FROM python:3.7-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install -t . -r requirements.txt

COPY cors.py wsgi.py run.sh ./

CMD ["./run.sh"]
