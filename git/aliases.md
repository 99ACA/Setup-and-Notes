# Use aliases

## .bashrc aliases

```bash
alias git-config_view='git config --list'
alias git-repo-remote-url='git remote get-url origin 2> /dev/null'

alias git-log='git log --graph --decorate --pretty=oneline --abbrev-commit 2> /dev/null'

alias git-clean-local-branches='git fetch --prune 2> /dev/null'
alias git-clean-untracked='git clean -fd -f 2> /dev/null'
alias git-clean-all='git_clean-local-branches && git_clean-untracked'

alias git-rebase-push-force='git push --force-with-lease'

alias git-delete-merged-branches-locally='git branch --merged 2> /dev/null | egrep -v "(^\*|master|main|develop|dev|stag|staging)" | xargs git branch -d'
alias git-reset-origin='git fetch origin 2>/dev/null && git reset --hard `git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null` && git clean -f -d'
```

* **Note**: other options, create in [git aliases](https://git-scm.com/book/ms/v2/Git-Basics-Git-Aliases)