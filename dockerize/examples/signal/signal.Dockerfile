FROM python:3.10-buster

WORKDIR /
COPY --chmod=0755 script.sh /
COPY main.py /

#SHELL ["/bin/bash", "-c"]
# ENTRYPOINT ["./script.sh"]

# Example in bash
# ENTRYPOINT /script.sh

# Example in python
ENTRYPOINT python3 -O main.py
