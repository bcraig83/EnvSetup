$arr = Get-ChildItem -Path $PSScriptRoot -Directory | 
       Where-Object {$_.PSIsContainer} | 
       Foreach-Object {$_.Name}

For ($i = 0; $i -le $arr.length-1; $i++){
    Write-Host "[" $i "] " $arr[$i]
}

$projectNo = Read-Host "Please select your project from the list above"
$projectName = $arr[$projectNo]
Write-Host $projectName

cinst $projectName\packages.config -y