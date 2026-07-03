$RazerPath = "C:\Windows\Installer\Razer"

# Enable driver auto-install via registry | Revert
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Installer" -Name "DisableCoInstallers" -Type DWord -Value 0

# Unlocks the Razer Folder | Revert
$Acl = Get-Acl $RazerPath
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("NT AUTHORITY\SYSTEM", "Write", "ContainerInherit,ObjectInherit", "None", "Deny")

$Acl.RemoveAccessRuleAll($Ar)
Set-Acl $RazerPath $Acl
