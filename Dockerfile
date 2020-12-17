FROM python:3.9-slim

ENV PYTHONUNBUFFERED True

# Add local code to the image instead of fetching from pypi.
COPY . .

RUN pip install -r requirements.txt

EXPOSE 8001
CMD datasette -p 8001 -h 0.0.0.0 district_data_sample.db