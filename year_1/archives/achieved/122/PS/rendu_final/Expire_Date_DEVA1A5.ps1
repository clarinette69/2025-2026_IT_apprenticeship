# csv file in same DIR as this script
$csvFile = Import-Csv -Delimiter ";" -Path "$PSScriptRoot\Users_DEVA1A5.csv"

foreach ($userData in $csvFile) {
    
    # Get expiration date from CSV
    $expirationDate = [DateTime]::Parse($userData.ExpirationDate)

    $department = $userData.Department

    $displayName = $userData.Firstname + ' ' + $userData.Lastname

    $checkUser = Get-ADUser -Filter {SamAccountName -eq $displayName}
    $checkDepartment = Get-ADOrganizationalUnit -Filter {Name -eq $department}

    if ($checkDepartment -and $checkUser){ # Check if User and Departement are both in the active directory

        # Update the account expiration date for the user
        Set-ADUser -Identity $displayName -AccountExpirationDate $expirationDate
        Write-Host -ForegroundColor green "Date d'expiration mise à jour pour l'utilisateur '$displayName'."
    } else {
        Write-Warning "L'utilisateur '$displayName' n'est pas trouvé dans l'active directory."
    }
}