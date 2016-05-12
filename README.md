# Nzbget Dockerfile

This is a dockerised version of nzbget. 

## Usage

The container has three volumes, one for configuration,
one for successfully downloaded files, and one for everything
else (lock files, queue, intermediates, etc).

Create named volumes for the config and main dirs:

```bash
docker volume create --name nzbget-config
docker volume create --name nzbget-main
```

Start a container, exposing the UI port, and binding all the
volumes: 

```bash
docker run -d --name nzbget \
              --restart always \
              -v nzbget-config:/config \
              -v nzbget-main:/maindir \
              -v /mnt/external/downloads:/destination \
              -p 6789:6789 \
              csmith/nzbget:16.4 
```

