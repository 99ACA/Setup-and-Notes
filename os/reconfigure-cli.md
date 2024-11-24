# Configure cli

## Guid lines

- .profile use to set PATH
- .bashrc use setup 

## Reconfigure

### reconfigure cli editor vi/vim

  - To install `vim`, run the following command:
  
    ```bash
    sudo apt install vim -y
    ```

  - Edit `~/.vimrc` Configuration

    To enable line numbers and syntax highlighting in vim, add the following to your `~/.vimrc` file:

    ```bash
    :set number 
    :set syntax=on
    ```
      Note: to remove line numbers from editor:

      ```bash
      :set number!
      ```

      Or:

      ```bash
      :set nonumber
      ```
### Organize the Aliases

  In the `~/.bashrc` file, call the .call_aliases.sh script, which set aliases from a specific directory. Here is an example structure:

  ```bash
    ~/.bashrc                   # call interactive Non-Login Shells & open a terminal emulator like GNOME Terminal
      ├── .plugin_aliases.d/      # Directory holding split aliases 
      │   ├── git-aliases.sh       # git aliases
      │   ├── ....              # 
      │   └── os-aliases.sh        # os aliases
      └── .plugin_aliases.sh      # run all files in .bash_aliases.d/
  ```

  * Add the following lines to your `~/.bashrc`

      ```bash
        ...
        if [ -f ~/.plugin_aliases.sh ]; then
          . ~/.plugin_aliases.sh
        fi
      ```

  * Create the aliases directory:

      ```bash
        mkdir $HOME/.bash_aliases.d
      ```
  * Create and add the following content into `~/.plugin_aliases.sh`

      ```bash
        #!/bin/bash

        DIRECTORY="${HOME}/.plugin_aliases.d"
        LOG="${HOME}/.bashrc.log"

        # Remove the log
        rm -f ${LOG}

        if [ -d "$DIRECTORY" ]; then
            # Loop through each file in the directory	
            for file in ${DIRECTORY}/*.sh; do
                if [ -f "$file" ]; then
                  source ${file} 2>>${HOME}/bashrc.log
                fi
            done
        else
            echo "The directory '$DIRECTORY' does not exist." > ${LOG}
        fi
      ```
### Other Tools

  ```bash
    sudo snap install chromium
    # Free DB IDE
    sudo snap install dbeaver-ce
    sudo snap install sqlitebrowser
    sudo snap install another-redis-desktop-manager
    # Editor
    sudo snap install sublime-text
    sudo snap install sublime-merge
  ```

  Note:
  * [Zoom](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0063458)