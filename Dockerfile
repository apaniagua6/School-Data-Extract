FROM python:3.7.2-slim-stretch 

ENV PORT 8001
ENV HOST 0.0.0.0

# Add local code to the image instead of fetching from pypi.
COPY . .

RUN pip install -r requirements.txt

EXPOSE 8001
CMD datasette district_data_sample.db