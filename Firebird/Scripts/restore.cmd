@ECHO OFF
SET dataFolder=c:\data
SET fbk=%dataFolder%\%1
SET db=%dataFolder%\%2

IF (%1)==() GOTO ARGUMENTMISSING
IF (%2)==() GOTO ARGUMENTMISSING

IF EXIST %fbk% GOTO RUN
IF NOT EXIST %fbk% GOTO FILENOTFOUND

:RUN
ECHO Performing restore of %fbk% to %db%
gbak.exe -r -p 4096 -user SYSDBA -pas masterkey -se localhost:service_mgr %fbk% %db%
ECHO Restore command done
GOTO EXIT

:ARGUMENTMISSING
ECHO Argument missing
GOTO EXIT

:FILENOTFOUND
ECHO Can't find file %fbk%
GOTO EXIT

:EXIT
ECHO Quitting and going home