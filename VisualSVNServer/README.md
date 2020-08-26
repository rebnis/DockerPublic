# VisualSVN Server

VisualSVN Server for hosting SVN repositories.

[Dockerfile](https://github.com/rebnis/DockerPublic/tree/master/VisualSVNServer)

## Using

```powershell
docker run -d `
-p 80:80 `
-v D:/MyRepos:C:/Repositories `
rebnis/visualsvnserver
```

Repositories can be managed via PowerShell, see links below.

**Access repositories**

* Web browser: http://*servername*
* Tortoise or other tool: http://*servername*/svn/*repository*


## Links

* [VisualSVN Server](https://www.visualsvn.com/server/)
* [PowerShell scripting](https://www.visualsvn.com/server/features/powershell/)
* [PowerShell Cmdlet Reference](https://www.visualsvn.com/support/topic/00088/)

