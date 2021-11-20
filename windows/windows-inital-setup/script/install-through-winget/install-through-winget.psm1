function Install-ThroughWinget {
    param (
        [string[]]$PackageList
    )
    
    foreach ($package in $PackageList) {
        winget.exe install $package  --accept-package-agreements
    }
}
Export-ModuleMember -Function Install-ThroughWinget
