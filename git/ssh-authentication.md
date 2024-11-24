# Authentication Using SSH for Git Operations

This guide explains how to configure SSH for Git operations, specifying a private key for each Git repository, without using the `ssh-add` command.

## Step 1: Generate SSH Keys

1. Generate SSH keys using the following commands:

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

2. Set appropriate permissions for the SSH directory and files:
   - SSH directory (~/.ssh/): 700 (permissions: drwx------)
   - Public key (bitbucket.xxx.pub): 644 (permissions: -rw-r--r--)
   - Private key (bitbucket.xxx): 600 (permissions: -rw-------)

3. Upload/Copy the generate public key to github/bitbucket/gitlab or any other

## Step 2: SSH Client Configuration

1. Configure the SSH client by editing the ~/.ssh/config file:

    ```bash
        Host bitbucket-xxx
            HostName bitbucket.org
            User git
            IdentityFile ~/.ssh/bitbucket.xxx
            IdentitiesOnly yes
    ```

2. Verify SSH Connection

    You can verify the SSH connection using the following command (note that this is without ssh-add):

    ```bash
        ssh -v -T git@bitbucket-xxx
    ```

This command uses the alias bitbucket-xxx, allowing different SSH keys to be used for different accounts.

## Step 3: Git Configuration

1. Configure Git to use the specified SSH key by modifying ~/.gitconfig:

    ```bash
    [user]
            name = user-x
            email = user@xxx.com

    [core]
            sshCommand = ssh -i ~/.ssh/bitbucket.xxx
    ```

2. Verify Git Configuration

    ```bash
        git clone git@bitbucket.org:YOUR_ACCOUNT/YOUR_PROJECT.git
        cd YOUR_PROJECT
        git config --get core.sshCommand
    ```
