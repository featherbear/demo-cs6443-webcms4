FROM python:3.8

WORKDIR /code

COPY repo/requirements.txt .

RUN pip install -r requirements.txt

# netcat for pwn
RUN apt-get update && apt-get install dos2unix netcat -y && apt-get clean

RUN echo "FLAG{AAAAA!!!}" > /flag

COPY repo/ .
RUN dos2unix checksubmission.sh

ENV FLASK_APP=run.py
ENV FLASK_DEBUG=1

CMD [ "flask", "run", "--host=0.0.0.0", "--port=8000" ] 
