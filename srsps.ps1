#ssh://port32%3Bpassword%3DX3Qu3h2j4w@ictencsvr1.ict.swin.edu.au/
#ssh://port31%3Bpassword%3DfDjg9BjZne@ictencsvr1.ict.swin.edu.au/
param(
    [Parameter(Mandatory=$true)][string]$str_url_ssh
)

Write-Output "URL recieved: "$str_url_ssh
$str_url_ssh = $str_url_ssh.Replace("ssh://","")
Write-Output "URL adjusted to: "$str_url_ssh," "

$str_host = $str_url_ssh.split("@")[1]
$str_host = $str_host.replace("/","")
Write-Output "Host: ",$str_host," "

$str_uname = $str_url_ssh.Substring(0,6)
Write-Output "Uname found: ",$str_uname," "

$str_url_ssh = $str_url_ssh.replace($str_uname,"")
$str_url_ssh = $str_url_ssh.replace($str_host,"")

$str_password = $str_url_ssh.replace("%3Bpassword%","")
$str_password = $str_password.replace("@","")
$str_password = $str_password.replace("/","")
Write-Output "Password: "$str_password," "

$str_combined = $str_uname+"@"+$str_host
$command = 'df -h'
$plinkpath = 'C:\Program Files\PuTTY\'

Write-Output y | &($plinkpath + "plink.exe") -pw $str_password $str_combined $command
