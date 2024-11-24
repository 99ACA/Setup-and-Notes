
# Examples

```bash
    : <<'comment_susppend_install'
    Create comment
    comment_susppend_install


    #Example for alias with params
    lsps()
    {
        ps -elf | grep "$1" | grep -v grep
    }
```