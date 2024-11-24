# Small modifications

## Modify editor to subline

1. [Install Subline Text using snap](https://snapcraft.io/sublime-text)
2. Add to Sublime text package [GitSavvy](https://packagecontrol.io/packages/GitSavvy)
3. Set global config, running `git config --global core.editor "subl -n -w"` updates the `~/.gitconfig` file.

## Fast forwarding

More information [see](https://blog.sffc.xyz/post/185195398930/why-you-should-use-git-pull-ff-only-git-is-a), [more options include merge](https://stackoverflow.com/questions/2500296/can-i-make-fast-forwarding-be-off-by-default-in-git)

 1. `git config --global pull.ff`
 2. `git config --global merge.ff` (not create an extra merge commit when merging a commit, this is also the default)
    * `git config  --global  branch.master.mergeoptions  "--no-ff"`
    * `git config  --global  branch.main.mergeoptions  "--no-ff"`
 3. Reconfigure the PS1

    ```bash
    __parse_git_branch_info() {
        local result=""
        if git rev-parse --is-inside-work-tree &>/dev/null; then
        # Get the current branch name
        local git_branch=$(git branch 2>/dev/null | grep '*' | sed 's/* //')
        # Check if there are uncommitted changes
        local git_dirty=$(git status --porcelain 2>/dev/null | wc -l)
        local git_status=""

        # If there are uncommitted changes, show "~modified"
        if [ "$git_dirty" -ne 0 ]; then
            git_status="~/modified"
        elif [ ! -z "$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)" ]; then
            ahead=$(git rev-list --count HEAD..@{u})
            behind=$(git rev-list --count @{u}..HEAD)
            if [ "$ahead" -gt 0 ] || [ "$behind" -gt 0 ]; then
                git_status="~/nsync"
            fi
        else
            git_status="~/nsync-branch"
        fi  
        
        result="(${git_branch}${git_status})"
        fi

        echo "$result"
    }


    export PS1='\[\033[1;36m\]\u@\h\[\e[32m\]\w\[\e[0;31m\]$(__parse_git_branch_info)\[\e[00m\]$ '

    ```

    * Explanation, `${ORIGINAL_PS1%\\$ }` This removes the final `$` from the original prompt temporarily. It allows you to replace it with the Git branch information and `$`
