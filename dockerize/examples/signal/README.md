# Signal issue with Docker

## Simulate the issue on local env

```bash
  docker build -t signal:latest -f ./signal.Dockerfile .
  docker run --rm --name=signal signal:latest
  # Open new terminal and run the following command, simulate orchestration `docker kill --signal=TERM signal`
  docker container stop signal
```

The solution is also describe here and very simple, just add `SHELL` into all docker (best practices is to use `CMD []`)

```bash
  ....
  SHELL ["/bin/bash", "-c"]
  ENTRYPOINT ....
```

For more information, [see](https://docs.docker.com/reference/build-checks/json-args-recommended/#explicitly-specify-the-shell)