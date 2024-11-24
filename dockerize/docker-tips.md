# Tips

## Run process and in/output host folders

* Using openapi-generator

```bash
  docker run --rm \
      --user $(id -u):$(id -g) \
      -v $(pwd -P)/..:/local/:rw openapitools/openapi-generator-cli:v3.3.4 generate \
      -i /local/swagger-api.yaml \
      -l javascript --additional-properties usePromises=true --additional-properties useES6=false \
      -o /local/clients/javascript
```

* Using mysql dump

```bash
  docker run --rm -it --network host mysql:8.4 mysqldump --databases $DBLIST \ 
  -h localhost -u $_user -P $_port --password=$_password --protocol=tcp --set-gtid-purged=OFF 1> $_dump_file
```

## Crash container

### Save & modify container state (create image from container)

  - create image from container

    ```bash
      # docker commit [container-id|name] [name for new container that crash]
      docker commit [container-id|name] crash-container
    ```

  - Start &run with different entry-point

    ```bash
      # Override container entrypoint
      docker run -ti --entrypoint=bash crash-container

      docker run -ti --entrypoint "/bin/sh" radius-crash # --network=my-net
    ```

  - See log file from running container

    ```bash
      docker exec -it squid tail -f /var/log/squid/access.log
    ```

## Multi Process In Container

-  check supervisord

## Security

- [Securely using .npmrc files, example](https://www.alexandraulsh.com/2018/06/25/docker-npmrc-security/)