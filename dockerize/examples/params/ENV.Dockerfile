# -- Build
# docker build -t python-server:latest -f ./ARG.Dockerfile .
# -- Run
# docker run --name python-example --rm -it python-server:latest

FROM python:3.10-buster

ENV PORT=${PORT:-2333}

CMD echo ${PORT:-"Not exist, PORT"} && python3 -m http.server --cgi $PORT 