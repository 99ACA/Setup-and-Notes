# -- Build
# docker build -t python-server:latest --build-arg PORT=8000 -f ./ARG.Dockerfile .
# -- Run
# docker run --name python-example --rm -it python-server:latest

FROM python:3.10-buster

ARG PORT

RUN echo $PORT

EXPOSE $PORT

CMD python3 -O -m http.server --cgi $PORT