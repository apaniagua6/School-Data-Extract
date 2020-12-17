FROM python:3.9-slim

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install -r requirements.txt

EXPOSE 8001
CMD datasette -p 8001 -h 0.0.0.0 district_data_sample.db