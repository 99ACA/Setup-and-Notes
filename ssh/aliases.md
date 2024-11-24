# Use aliases

## .bashrc aliases

```bash
alias ssh-agent_status='systemctl --user status ssh-agent'
```

## SSH Aliases

### Regular SSH Connect

```bash
Host XXX-machine 
    HostName ec2-ZZZ.compute-1.amazonaws.com
    User ec2-user
    IdentityFile ~/.ssh/XXX-machine.pem
```

### Tunnel

```bash
Host jump
    HostName ec2-TTT.us-east-2.compute.amazonaws.com
    User ec2-user
    Port 22
    IdentityFile ~/.ssh/Jump-Server/Used_By_Jump.pem
Host tunnel
    HostName ec2-TTT.us-east-2.compute.amazonaws.com
    User ec2-user
    Port 22
    IdentityFile ~/.ssh/Jump-Server/Used_By_Jump.pem
    LocalForward 28080 127.0.0.1:3306
```
