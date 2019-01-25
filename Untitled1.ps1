    param(
    [string]$buildid
    )

if ($buildid -eq "")
{
    Write-Host -BackgroundColor DarkGreen "Works!!!!!"
}

else {
$username = "vivolodko@icloud.com"
$password = "thvbj3kl3hai6wsvfbrripv46cuikxahuqhcctcuoawmw2uh5ygq"
$basicAuth = ("{0}:{1}" -f $username,$password)
$basicAuth = [System.Text.Encoding]::UTF8.GetBytes($basicAuth)
$basicAuth = [System.Convert]::ToBase64String($basicAuth)
$headers = @{Authorization=("Basic {0}" -f $basicAuth)}

$body = "{'definition' : {'id' : $buildid}}"
$type = "application/json"
   # $body = @{
   # definition = @{
   # id = $buildid   
   # }
   # }
   $Uri = "$($env:SYSTEM_TeamFoundationCollectionUri)/$env:SYSTEM_TEAMPROJECTID/_apis/build/builds?api-version=2.0"
   Write-Host -BackgroundColor DarkGreen $Uri
   #$Uri = "https://dev.azure.com/vivolodko/First_project/_apis/build/builds?api-version=2.0"
   # $buildresponse = Invoke-RestMethod -Method Post -ContentType application/json -Uri $Uri -Headers $headers -Body (ConvertTo-Json $body) 
   # write-host "Definition = $($buildresponse | ConvertTo-Json -Depth 100)"   
   $buildresponse = Invoke-RestMethod -Method Post -ContentType $type -Uri $Uri -Headers $headers -Body $body 
   write-host "Definition = $($buildresponse | ConvertTo-Json -Depth 100)"   
   }