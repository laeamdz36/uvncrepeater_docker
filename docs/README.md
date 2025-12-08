To runf interactive and inspect the container

This enters to the container sheel, using the -it flag (interactive + terminal)
and overrides the start command with bash:

```bash
docker run --rm -it debug-repeater /bin/bash
```

By this way, we enter to the container and is possible to perform tests and validate
direcotries and files in the file system.