# Tips

## How to Reach Localhost on Host from Docker Container

[adds hostname mappings at build-time, extra_hosts](https://docs.docker.com/reference/compose-file/build/#extra_hosts)

[More info](https://medium.com/@TimvanBaarsen/how-to-connect-to-the-docker-host-from-inside-a-docker-container-112b4c71bc66)

  ```bash
    service-name:
      build:
        context: ./service-name
        dockerfile: Dockerfile
      ports:
        - 27026:27026
      links:
        - service_z_depends_on # https://docs.docker.com/reference/compose-file/services/#links
      environment:
        ....
        - SERVICE_X_URL=http://host.docker.internal:55555
      extra_hosts:
        - host.docker.internal:host-gateway
  ```


## HEALTHCHECK


  ```bash
    FROM ....
    WORKDIR ***
    COPY . .
    HEALTHCHECK CMD curl --fail http://localhost:5050/ || exit 1
    ...
  ```

## docker-compose - env order

If it can’t find a value, docker-compose will look for values inside of the provided environment file and even the Dockerfile. Here’s the lookup order, as you can find in the [docs](https://docs.docker.com/compose/environment-variables/):

1. Compose file
2. Shell environment variables
3. Environment file
4. Dockerfile
5. Variable is not defined

[More Info](https://vsupalov.com/override-docker-compose-dot-env/)