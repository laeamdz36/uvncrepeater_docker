![Static Badge](https://img.shields.io/badge/Docker-2CA5E0?style=plastic&logo=docker&logoColor=white)
![Static Badge](https://img.shields.io/badge/C%2B%2B-%2300599C?style=plastic&logo=cplusplus)

# This proyect  will compose with docker a reverse proxy with nginx and websockify


# Ultra VNC Repeater Docker

Building of docker image with debian linux distribution

The dockefilr use the linux debian image, copy the .tar.gz to the image, compile and momves
the binary executable to a location to finally perform the execution with the user configured in the 
uvncrepeater.ini

Repeater source code to use Make C ``uvncrepeater.tar.gz``:  
[uvncrepeater](https://www.uvnc.eu/download/repeater/uvncrepeater.tar.gz)

Running the container and configure the listening ports:
```bash
docker run --rm -p 5900:5900 -p 5901:5901 uvnc-repeater
```
Running the repeater with diferent ports for testing
port host : port container
```bash
docker run --rm -p 5902:5900 -p 5903:5901 uvnc-repeater
```
To run interactive and inspect the container
This enters to the container shell, using the -it flag (interactive + terminal)
and overrides the start command with bash:  
By this way, we enter to the container and is possible to perform tests and validate
direcotries and files in the file system.
```bash
docker run --rm -it debug-repeater /bin/bash
```

### UltraVNC Service Clean Re-registration

Possible issue: The UltraVNC server installed in the remote host is configured to perform a reverse connection to a vnc repeater
usually using the port ``5900`` to perform server connection, also is configured a keepalive timing to persist the connection
and allow to the repeater mantain the route to the remote host by its configured ID.

Is possible if changes performed to the ``service_commandline`` config in the ``ultravnc.ini`` file not take effect only by restaring 
the service in the services windows tool, is necessary to uninstall the service, modify the conten or update to a correct ini file
and at the final install the service

### Utils commands for powershell stop services

Find the process id for the uvnc server PID service
```powershell
Get-Process | Where-Object {$_.Path -like "*uvnc*"}
```

kill the process
```powershell
taskkill /PID <PID> /F /T
```