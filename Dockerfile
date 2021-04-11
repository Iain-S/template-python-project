# Docker file, which can be used for CI or local testing
FROM python:3

COPY . /proj
WORKDIR /proj
RUN pip install -r requirements.txt

RUN ./run_tests.sh