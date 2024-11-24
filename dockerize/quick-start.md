# Quick Start

## Install 

* [install](https://docs.docker.com/engine/install/ubuntu/)
* [post-installation steps (Manage Docker as a non-root user, service)](https://docs.docker.com/engine/install/linux-postinstall/)
* [docker-compose](https://docs.docker.com/compose/install/linux/)


## Compose

* Add `~/pcode/tools/compose-infra.yml` the following data

  ```yaml
    services:

        postgres: # https://hub.docker.com/_/postgres
            container_name: pglobal-postgres
            image: postgres:17
            environment:
            - POSTGRES_DB=main
            - POSTGRES_USER=pglobal
            - POSTGRES_PASSWORD=pglobal
            ports:
            - 5432:5432/tcp      
            volumes:
            - pglobal_postgres:/var/lib/postgresql/data      
            networks:
            pBackend:
                aliases:
                - postgres

        mysql: # https://hub.docker.com/_/mysql
            container_name: pglobal-mysql
            image: mysql:8.4
            environment:
            - MYSQL_ROOT_PASSWORD=pglobal # root/pglobal
            - MYSQL_USER=pglobal
            - MYSQL_PASSWORD=pglobal
            - MYSQL_DATABASE=main
            ports:
            - 3306:3306/tcp
            volumes:
            - pglobal_mysql:/var/lib/mysql
            networks:
            pBackend:
                aliases:
                - mysql

        redis:
            container_name: pglobal-redis  
            image: redis:7.4
            ports:
            - 6379:6379/tcp
            volumes:
            - pglobal_redis:/data
            networks:
            pBackend:
                aliases:
                - redis


        rabbit: # use - amqp://guest:guest@rabbit:5672//
            container_name: pglobal-rabbit  
            image: rabbitmq:4.0-management
            ports:
            - 17000:15672 # Used by HTTP API clients, management UI
            - 5672:5672
            environment:
            - RABBITMQ_DEFAULT_USER=pglobal
            - RABBITMQ_DEFAULT_PASS=pglobal
            volumes: #Persisting
            - pglobal_rabbitmq:/var/lib/rabbitmq
            networks:
            pBackend:
                aliases:
                - rabbit

        networks:
        pBackend:
            # Specify driver options
            driver: bridge
            driver_opts:
            com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
            name: pBackend

        volumes:
        pglobal_postgres:
            name: pglobal_postgres
        pglobal_mysql:
            name: pglobal_mysql
        pglobal_redis:
            name: pglobal_redis
        pglobal_rabbitmq:
        name: pglobal_rabbitmq
  ```

  The following aliases can be useful

  ```bash
    alias pinfra-up='docker compose --project-name pinfra --file ~/pcode/tools/compose-infra.yml up -d --remove-orphans'
    alias pinfra-down='docker compose --project-name pinfra --file ~/pcode/tools/compose-infra.yml down'
  ```