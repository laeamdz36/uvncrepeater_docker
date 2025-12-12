![Static Badge](https://img.shields.io/badge/Docker-2CA5E0?style=plastic&logo=docker&logoColor=white)
![Static Badge](https://img.shields.io/badge/C%2B%2B-%2300599C?style=plastic&logo=cplusplus)

# Docker reverse proxy will be implementation for deploy websockify custom and novnc server without repeater

### Versions

websockfy: 
novnc:


### Utils commands for powershell stop services

Find the process id for the uvnc server PID service
```powershell
Get-Process | Where-Object {$_.Path -like "*uvnc*"}
```

kill the process
```powershell
taskkill /PID <PID> /F /T
```