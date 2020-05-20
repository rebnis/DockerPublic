# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# ERLANG_HOME: Erlang will install to this location and RabbitMQ will use this environment variable to locate it
# RABBITMQ_VERSION: RabbitMQ version used in download url and to rename folder extracted from zip-file
# RABBITMQ_CONFIG_FILE: Tell RabbitMQ where to find our custom config file
ENV ERLANG_HOME="c:\erlang" `
	ERLANG_VERSION="21.2" `
    RABBITMQ_VERSION="3.7.12" `
    RABBITMQ_CONFIG_FILE="c:\rabbitmq"

EXPOSE 5672 15672

# Download and install Erlang and RabbitMQ
RUN Invoke-WebRequest "http://erlang.org/download/otp_win64_$env:ERLANG_VERSION.exe" -OutFile "c:\erlang_install.exe" ; `
	Start-Process -Wait "c:\erlang_install.exe" -ArgumentList /S, /D=$env:ERLANG_HOME ; `
	Remove-Item "c:\erlang_install.exe" -Force ; `
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; `
	Invoke-WebRequest "https://github.com/rabbitmq/rabbitmq-server/releases/download/v$env:RABBITMQ_VERSION/rabbitmq-server-windows-$env:RABBITMQ_VERSION.zip" -OutFile "c:\rabbitmq.zip" ; `
	Expand-Archive "c:\rabbitmq.zip" "c:\\" ; `
	Remove-Item "c:\rabbitmq.zip" -Force ; `
	Rename-Item "c:\rabbitmq_server-$env:rabbitmq_version" "c:\rabbitmq"

# Create config and enable management plugin
RUN ["cmd", "/C", "echo [{rabbit, [{loopback_users, []}]}].> c:\\rabbitmq.config"]
RUN c:\rabbitmq\sbin\rabbitmq-plugins.bat enable rabbitmq_management --offline

# Start RabbitMQ server
CMD c:\rabbitmq\sbin\rabbitmq-server.bat
