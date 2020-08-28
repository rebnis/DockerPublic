# Firebird

Firebird open source database.

[Dockerfiles](https://github.com/rebnis/DockerPublic/tree/master/Firebird)

## Using

```powershell
docker run -d `
-p 3050:3050 `
-v D:\Databases:C:\Data `
-e Aliases="alias1=c:\data\myDb1.fdb;alias2=c:\data\myDb2.fdb" `
rebnis/firebird
```

* Multiple aliases can be set by separating with ;
* Aliases are not required

**Connection string:**

* If port 3050 is published to host: "localhost:c:\data\myDb1.fdb"
* If hostname "firebird" is set for container: "firebird:c:\data\myDb1.fdb"
* If alias is set: "localhost:alias1" or "firebird:alias1"

* Username and password is default SYSDBA and masterkey

### Backup/restore

Included cmd-scripts can be used to perform a backup or restore with default values (page size 4096 and default user / password). Databases are assumed to be in c:\data folder so only database name is required. Aliases can't be used here, only filename.

**Backup using a separate work container**

```powershell
docker run -it `
-v D:\Databases:C:\Data `
rebnis/firebird `
backup myDb1.fdb myBackup1.fbk
```

**Restore using a separate work container**

```powershell
docker run -it `
-v D:\Databases:C:\Data `
rebnis/firebird `
restore myBackup1.fbk newMyDb1.fdb
```

**Backup by attaching to running container**

```powershell
docker exec -it firebird `
backup.cmd myDb1.fdb myBackup1.fbk
```

**Restore by attaching to running container**

```powershell
docker exec -it firebird `
restore.cmd myBackup1.fbk myNewDb1.fdb
```

**Other tools**

Firebirds bin-folder is included in PATH for easy access and gbak, gfix, isql etc. can be run by attaching to running container

```powershell
docker exec -it firebird `
<toolname> <parameters>
```

Example of custom database restore to overwrite existing file (not supported by included restore.cmd) and other page size

```powershell
docker exec -it firebird `
gbak -r -rep -p 8192 -user SYSDBA -pas masterkey -se localhost:service_mgr c:\data\myBackup1.fbk c:\data\myDb1.fdb
```

### More info

WireCrypt is set to Enabled in 3.0 image.

If you are using SQL Manager or other similar tool to access the database, make sure to select protocol TCP/IP instead of local. You might also have to download fbclient.dll manually and place in folder where SQL Manager can find it. File is available in the zip-packages on the Firebird homepage, link below.

## Links

* [Firebird](https://firebirdsql.org/)

