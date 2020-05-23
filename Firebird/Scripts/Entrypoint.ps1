Param (
	[string]$Tool,
    [string]$Arg1,
    [string]$Arg2
)

function ConfigureAliases
{
    if ($Env:Aliases)
    {
        Write-Host "Configuring Firebird aliases."

        $aliases = $Env:Aliases.Split(";")

        # Firebird 2.0 and 2.5 uses aliases.conf
        $aliasesFile = "$Env:FIREBIRD_HOME\aliases.conf"
        
        if (![System.IO.File]::Exists($aliasesFile))
        {
            # Firebird 3.0 uses databases.conf
            $aliasesFile = "$Env:FIREBIRD_HOME\databases.conf"

            # Default security db settings for Firebird 3.0
            $aliases += ""
            $aliases += 'security.db = $(dir_secDb)/security3.fdb'
            $aliases += "{"
            $aliases += "`tRemoteAccess = false"
            $aliases += "`tDefaultDbCachePages = 50"
            $aliases += "}"
            $aliases += ""
        }
        
        Set-Content $aliasesFile $aliases
    }
}

ConfigureAliases

# Run command
if ($Tool -and $Arg1 -and $Arg2)
{
    if ($Tool -eq "backup")
    {
        .\backup.cmd $Arg1 $Arg2
    }
    elseIf ($Tool -eq "restore")
    {
        .\restore.cmd $Arg1 $Arg2
    }
    else 
    {
        Write-Host 'Unknown command for tool. Use "backup" or "restore".'
    }

    Exit
}

Write-Host "Firebird container running."
Write-Host "Use docker exec to enter container."

# Keep container alive
while ($true) 
{ 
    Start-Sleep -Seconds 3600 
}
