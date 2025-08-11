# csv file in same DIR as this script
$csvFile = Import-Csv -Delimiter ";" -Path "$PSScriptRoot\Users_DEVA1A5.csv"

foreach ($data in $csvFile) {

    # Separate the $data.OU string at each commmas => OU=_RH,DC=ad.DC=private becomes an array with [OU=_RH, DC=ad, DC=private]
    $organizationsUnits = $data.OU.Split(',') | Select-Object -Unique # Select-Object -Unique eliminates any duplicates

    # Remove the first element of the array and join the 2 last ones with a ','
    $OUpath = ($organizationsUnits | Select-Object -Skip 1) -join ','

    [String]$department = $data.Department | Select-Object -Unique

    # Check if the OU is already in the active directory
    $checkOU = Get-ADOrganizationalUnit -Filter "Name -eq '$department'"

    if (-not $checkOU) {
        # If the OU exists in the active directory, do nothing.

        # If the OU does not exist in the active directory, add it.

        # For debbuging purposes, '-ProtectedFromAccidentalDeletion $false' allowes us to delete the OU without modifing their 
        New-ADOrganizationalUnit -Name $department -Path $OUpath
        Write-Output "L'OU '$department' a été créé !"

    }
}