# Ubuntu 22.04

## Install X Server

```bash
ps aux | grep Xorg
# or
sudo apt update
sudo apt install xorg
```

## Enable X11 Forwarding

```bash
xhost +local:docker
```

## Build and run

```bash
docker build -t playwright-gui .
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix playwright-gui
```
