# escape=`
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2-windowsservercore-ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

EXPOSE 85
VOLUME C:/Packages

# Set port on default web site
RUN	Import-Module WebAdministration ; `
 	Set-WebBinding -Name 'Default Web Site' -BindingInformation "*:80:" -PropertyName Port -Value 85

# Remove default www-root content
RUN Remove-Item -Recurse c:\inetpub\wwwroot\* ; 

# Copy NuGetserver
COPY deploy c:\inetpub\wwwroot\
