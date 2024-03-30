# pacman-cache-nginx-docker

## A simple Nginx reverse proxy to cache Arch Linux packages for pacman updates

### Setup

#### 1. On the host that will be the proxy server:

Download this repo, and update the `mirrorlist` with the mirrors you wish to proxy from.

Run `./docker-run.sh` to start the service

Run `./docker-stop.sh` to stop the service

#### 2. On the client, the Arch Linux systems:

Set your pacman mirrorlist to use your server, you may wish to 
backup your mirrorlist first:

```
cp -a /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo 'Server = http://xx.xx.xx.xx:pppp/$repo/os/$arch' > /etc/pacman.d/mirrorlist
```

In the above command, change "xx.xx.xx.xx:pppp" to your IP address and port of the server. By default, the listening port is 5000, you can change this in the `docker-run.sh` script.

Double check your `/etc/pacman.conf` is using the mirror list from `/etc/pacman.d/mirrorlist`, this is the default behaviour, so you shouldn't need to change your pacman.conf, unless you've modified it previously.


That's it.
