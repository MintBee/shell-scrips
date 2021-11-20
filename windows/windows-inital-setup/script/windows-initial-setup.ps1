Import-Module -Name $PSScriptRoot\convert-caps-and-ctrl
Import-Module -Name $PSScriptRoot\install-through-winget
Import-Module -Name $PSScriptRoot\install-wsl

Convert-CapsAndCtrl

# Winget 
$PackagesToInstall = @("Microsoft.PowerShell", "Microsoft.WindowsTerminal",
"JetBrains.Toolbox", "Bandisoft.Bandizip", "Discord.Discord", "Microsoft.VisualStudio.2022.BuildTools", 
"Microsoft.VisualStudioCode", "9N8GPB2TK8GB", "9WZDNCRFHVFW", "Python.Python.3", "Anaconda.Anaconda3",
"Git.Git", "GitHub.cli", "Microsoft.dotnet", "Kakao.KakaoTalk", "Notion.Notion", "Axosoft.GitKraken")
Install-ThroughWinget($PackagesToInstall)

# git setting
Copy-Item $PSScriptRoot\.gitconfig $HOME\.gitconfig
git config --global core.editor "code --wait"

# ssh-agent
Copy-Item $PSScriptRoot\ssh-config $HOME\.ssh\config
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
ssh-agent.exe

# WSL install
Install-WSL