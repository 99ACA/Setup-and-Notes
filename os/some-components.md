
## Network - Management network in ubuntu 

    ```bash
        # command-line tool for controlling NetworkManager
        nmcli
        #list ip interfaces
        ip a
        #show the HW that related to network
        lshw -class network
    ```

## Services

systemctl - control service management & systemd 

* List all enabled/running/active ones

    ```bash
        systemctl list-unit-files --state=enabled
        systemctl list-units --type=service --state=running
        systemctl list-units --type=service --state=active
    ```

* Start service and add it to the boot time with the systemctl command

    ```bash
       systemctl start  <service name>
        # Boot enable/disable
       systemctl enable <service name>
    ```

## Package Manager

    ```bash
    # list entire packet that install
    apt list --installed  

    #Updates the list of available packages and their versions.  
    #Not install or upgrade any packages
    sudo apt update

    # Installs newer versions of the packages
    sudo apt upgrade

    #List  /var/lib/dpkg/status
    dpkg-query -l 'regex'

    #find packag install - example
    dpkg -s package_name

    #remove package & config file
    dpkg --purge package_name
    ```

## Permissions

* list login users

  ```bash
    w
  ```

* list users (logged into current host) and group

    ```bash
        users 
        groups
    ```


## Mount

```bash
    sudo apt install cifs-utils
    sudo mount -t cifs //192.168.1.200/sysvol ~/mnt --verbose -o  user=pt@lab19,pass=[password]

    sudo umount -f ~/mnt

    find . -type f -print0 2> /dev/null | xargs -0 grep -iI "Version=0"
```