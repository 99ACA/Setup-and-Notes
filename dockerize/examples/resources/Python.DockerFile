# docker build -t python-server:latest --build-arg PORT=8000 -f ./Python.DockerFile .
# docker images python-server:latest
# docker history python-server:latest

# docker run --name python-example --rm -it python-server:latest



# -- execute command in the container
# docker exec -d python-example touch /tmp/exec_cmd

# (*) See what change in the container: C - Changed ; A - Add ; D - Delete
# docker diff python-example

#----------------------------
# container’s processes
#----------------------------
# docker exec -it python-example ps aux
# docker top python-example

FROM python:3.10-buster
LABEL course.docker="resource" course.docker.example="example-value"


ARG PORT 23333

# ENV PORT=${PORT:-8001}
# RUN echo $PORT

# Run
CMD echo $PORT && python3 -m http.server --cgi $PORT 