# csv file in same DIR as this script
$csvFile = Import-Csv -Delimiter ";" -Path "$PSScriptRoot\Users_DEVA1A5.csv"

# Get all the unique OU
$OUs = $csvFile.OU | Select-Object -Unique

#For each OUs, get all the users and store them in userList
$userList = Foreach($OU in $OUs){
        Get-ADUser -Filter * -SearchBase $OU | Select-Object SamAccountName 
}

Write-Host -ForegroundColor green User list generated

# Export the list in a csv file and remove additionnal info
$userList | Export-CSV -Path "$PSScriptRoot\Users_exported.csv" -NoTypeInformation

Write-Host -ForegroundColor green User list exported to $PSScriptRoot\Users_exported.csv

# Get the current date for later use as a file name
$date = Get-Date -Format('yyyyMMdd')

# Path at which we'll move the .zip file later. We -Force the creation to replace any previous directory without generating an error
$destinationPath = new-item -Path C:\Workspace\Back_up -ItemType Directory -Force

# Compression into a .zip by default
Compress-Archive `
    -path "$PSScriptRoot\Users_exported.csv" `
    -DestinationPath "$PSScriptRoot\$date" `
    -CompressionLevel Optimal

Write-Host -ForegroundColor green Compression completed

move-item -Path "$PSScriptRoot\*.zip" -Destination $destinationPath -Force

Write-Host -ForegroundColor green $PSScriptRoot\$date.zip moved to $destinationPath