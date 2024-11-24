

### Configuration Info

  ```bash
    docker version
    docker info
  ```


### Connect to running container

  ```bash 
    # Run
    docker run -it image-name
    #OR change entrypoint (of specific image)
    docker run --entrypoint /bin/sh  -it image-name
  ```

  ```bash
    # Assuming Bash is available in the container
    docker exec -it [container-name] /bin/bash

    # create
    docker create -it --name exchange pypy:3
    # start & connect
    docker start exchange
    docker exec -it exchange bash
  ```

### Copy file from docker to local machine 

  ```bash
    # docker cp [container-name]:/[full-path]  [machine-location]
    docker cp postgres-db:/tmp/companies_db.csv .
  ```