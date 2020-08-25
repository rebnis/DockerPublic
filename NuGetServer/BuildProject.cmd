@ECHO OFF
nuget restore Source\NuGetServer.sln
msbuild Source/Build.proj /p:configuration=Release;publish=true /p:PublishDir="Deploy"

:Delete some folders and files
RD /S /Q Deploy\bin\de
RD /S /Q Deploy\bin\es
RD /S /Q Deploy\bin\fr
RD /S /Q Deploy\bin\it
RD /S /Q Deploy\bin\ja
RD /S /Q Deploy\bin\ko
RD /S /Q Deploy\bin\ru
RD /S /Q Deploy\bin\zh-Hans
RD /S /Q Deploy\bin\zh-Hant
RD /S /Q Deploy\bin\roslyn
DEL Deploy\bin\*.pdb /q

PAUSE
