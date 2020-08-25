# NuGetServer

A simple NuGetServer for hosting internal packages.

[Dockerfile](https://github.com/rebnis/DockerPublic/tree/master/NuGetServer)

## Using

```powershell
docker run -d `
-v D:/NuGetPackages:C:/Packages `
-p 85:85 `
rebnis/nugetserver
```

### Important regarding port

The port used to access the service, i.e. 85, must be set for Default Web Site in the Dockerfile as well. Mapping a container port to another host port works in Visual Studio but not via the NuGet CLI (attempts to download package from the IIS web site port instead of the mapped port on the host).

## Managing packages

* Add URL to the feed  http://<servername>:85/nuget to Visual Studio, NuGet.config etc.

### Push package

```cmd
nuget push C:\AppSource\MyPackage.1.2.3.nupkg -apikey nugetkey -source http://<servername>:85/nuget
```

### Delete package

```cmd
nuget delete MyPackage 1.2.3 -apikey nugetkey -source http://<servername>:85/nuget -NonInteractive
```

## Server Source

A simple web server to show a NuGet package feed

### Updating to latest version

* Open the solution in Visual Studio and perform NuGet package upgrade
* Run BuildProject.cmd to build and copy files to the Deploy folder
* Build a new Docker image

## Version

Tag "latest" uses following versions:

* Windows Server 2016 (servercore:ltsc2016)
* NuGet Server 3.4.1

## Links

* [Microsoft Docs on NuGet](https://docs.microsoft.com/en-us/nuget/)
* [Microsoft Docs on hosting NuGet server](https://docs.microsoft.com/en-us/nuget/hosting-packages/nuget-server)
* [NuGet.Server on GitHub](https://github.com/NuGet/NuGet.Server)

