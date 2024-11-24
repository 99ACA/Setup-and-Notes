
```bash
    # See the docker service logs
    alias docker-svc-log='journalctl -xu docker.service'
    alias docker-svc-status='systemctl status docker.service'

    alias docker-compose-up='docker compose up -d --remove-orphans'
    alias docker-compose-down='docker compose down'
    alias docker-compose-ls='docker compose ls'

    # compose project that contain basic infra (rabbitMQ, redis, mysql ...) 
    alias pinfra-up='docker compose --project-name pinfra --file ~/pcode/tools/compose-infra.yml up -d --remove-orphans'
    alias pinfra-down='docker compose --project-name pinfra --file ~/pcode/tools/compose-infra.yml down'

    alias docker-rm-all='docker ps -aq | xargs -r docker rm -f'
    alias docker-rm-stop-containers='docker ps --filter status=exited -qa | xargs -r docker rm -f'
    alias docker-df='docker system df'

```