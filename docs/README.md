To runf interactive and inspect the container

This enters to the container sheel, using the -it flag (interactive + terminal)
and overrides the start command with bash:

```bash
docker run --rm -it debug-repeater /bin/bash
```

Run the container
```bash
 docker run --rm -it uvnc-repeater
```

By this way, we enter to the container and is possible to perform tests and validate
direcotries and files in the file system.

Running the repeater with diferent ports for testing
port host : port container
```bash
docker run --rm -p 5902:5900 -p 5903:5901 uvnc-repeater
```

Find the process id for the uvnc server PID service

```powershell
Get-Process | Where-Object {$_.Path -like "*uvnc*"}
```

kill the process
```powershell
taskkill /PID <PID> /F /T
```

