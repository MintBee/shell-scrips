function Install-WSL {
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Start-Process $PSScriptRoot\wsl_update_x64.msi
    wsl --set-default-version 2
    winget.exe install Canonical.Ubuntu -i
    ubuntu.exe
}
Export-ModuleMember -Function Install-WSL