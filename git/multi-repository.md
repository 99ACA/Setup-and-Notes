# Working with Multi Git Repositories

This guide covers managing multiple Git repositories,
where one path (`~/code/company-xxx`) syncs with a company SCM and another (`~/code/personal`) with a private repository.
It demonstrates how to sync these separate repositories to streamline workflows across both environments.

## Step 1: Configure Git ~/.gitconfig

   ```bash
    [includeIf "gitdir:~/code/company-xxx/**"]
        path = .git-config/.gitconfig-company-xxx


    [includeIf "gitdir:~/code/personal/**"]
        path = .git-config/.gitconfig-personal
   ```

## Step 2: Configure each SCM

### Example of Personal SCM Configuration

```bash
[user]
    email = your_email@example.com
[core]
    sshCommand = ssh -i ~/.ssh/github-personal-gmail
```

### Example of Company-xxx SCM Configuration

```bash
[user]
    email = your_email@company-xxx.com
[core]
    sshCommand = ssh -i ~/.ssh/bitbucket-company-xxx
```

### Note

For more information on sshCommand, see [SSH Authentication](./ssh-authentication.md).
