# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2019 as builder

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

EXPOSE 80

# Install ServiceMonitor
RUN Invoke-WebRequest "https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.6/ServiceMonitor.exe" `
	-OutFile "C:\ServiceMonitor.exe" ;

# Install VisualSVN Server
RUN Invoke-WebRequest "https://www.visualsvn.com/files/VisualSVN-Server-4.2.2-x64.msi" `
	-OutFile "c:\svn-server.msi" ; `
 	Start-Process -Wait "c:\svn-server.msi" ; `
 	Remove-Item "c:\svn-server.msi" -Force ; 

# Delete default repo-folder and recreate empty for mapping
RUN Remove-Item -Recurse C:\Repositories ;
VOLUME C:/Repositories

ENTRYPOINT ["C:\\ServiceMonitor.exe", "VisualSVNServer"]

FROM builder

# Run on port 80 with http
RUN Set-SvnServerConfiguration -ListenPort 80 ; `
	Set-SvnServerConfiguration -EnableSSL $False ;

ENTRYPOINT ["C:\\ServiceMonitor.exe", "VisualSVNServer"]