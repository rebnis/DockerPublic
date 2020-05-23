@ECHO OFF
SET dataFolder=c:\data
SET db=%dataFolder%\%1
SET fbk=%dataFolder%\%2

IF (%1)==() GOTO ARGUMENTMISSING
IF (%2)==() GOTO ARGUMENTMISSING

IF EXIST %db% GOTO RUN
IF NOT EXIST %db% GOTO FILENOTFOUND

:RUN
ECHO Performing backup of %db% to %fbk%
gbak.exe -b -t -user SYSDBA -pas masterkey -se localhost:service_mgr %db% %fbk%
ECHO Backup command done
GOTO EXIT

:ARGUMENTMISSING
ECHO Argument missing
GOTO EXIT

:FILENOTFOUND
ECHO Can't find file %db%
GOTO EXIT

:EXIT
ECHO Quitting and going home