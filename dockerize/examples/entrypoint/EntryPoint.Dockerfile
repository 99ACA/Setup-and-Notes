# docker build -t cmd:latest -f ./EntryPoint.Dockerfile .
# docker run --rm cmd:latest "what now?"
# docker run -it --rm --entrypoint /bin/echo cmd:latest "what now?"
# docker run -it --rm --entrypoint less cmd:latest "/usr/local/bin/docker-entrypoint.sh"

# docker exec cmd ps -ef

# ----
# docker run -it --rm --entrypoint less cmd:latest "/ignore-copy.txt"


FROM bash

COPY * /.

ENTRYPOINT ["echo","Hello-ENTRYPOINT"]
CMD ["echo","Hello-CMD"]

# Is there different between [] without

# ENTRYPOINT echo "Hello"
# CMD echo "Hello-CMD"
