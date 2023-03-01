#getting pc username
$name = (Get-WMIObject -ClassName Win32_ComputerSystem).Username
$new = $name -replace 'AzureAD\\',''
#$new = $name -replace 'Varun-PC\\',''

$new

#dsregcmd path
$dsoldpath = 'C:\Users\replace\dscomputerinfo.xls'

$dsnewpath = $dsoldpath -replace 'replace',$new

$dsnewpath

#workgroup path
$wgoldpath = 'C:\Users\replace\wgcomputerinfo.xls'
$wgnewpath = $wgoldpath -replace 'replace',$new

$wgnewpath

#onedrive process path
$odoldpath = 'C:\Users\replace\odcomputerinfo.txt'
$odnewpath = $odoldpath -replace 'replace',$new

$odnewpath

#onedrive get process info
#$ProcessName = "chrome"
#get-process $ProcessName -ErrorAction SilentlyContinue | Out-File $odnewpath


#if((get-process $ProcessName -ErrorAction SilentlyContinue) -eq $Null)
#{ echo "Process is not running" }else{ echo "Process is running" } 



function getonedrivestatus {
$ProcessName = "onedrive"
get-process $ProcessName -ErrorAction SilentlyContinue


if((get-process $ProcessName -ErrorAction SilentlyContinue) -eq $Null)
{ echo "Process is not running" }else{ echo "Process is running" }
}

getonedrivestatus | Out-File $odnewpath






#OutFiles
dsregcmd /status | Out-File $dsnewpath

(Get-WmiObject -Class Win32_ComputerSystem).Workgroup | Out-File $wgnewpath

