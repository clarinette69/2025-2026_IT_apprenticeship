# csv file in same DIR as this script
$csvFile = Import-Csv -Delimiter ";" -Path "$PSScriptRoot\Users_DEVA1A5.csv"

# For each member, insert them in right OU

foreach ($userData in $csvFile) {

    $displayName = $userData.Firstname + ' ' + $userData.Lastname

    if (Get-ADUser -Filter {SamAccountName -eq $displayName}){ # Check if user already in the active directory.
    
        Write-Warning "L'utilisateur '$displayName' est déjà enregistré dans l'active directory"
        Write-Output "Aucune action requise."

    } else {

        <#
            Explaining New-ADUser

            -Name
            -SamAccountName    => SAM means Security Account Manager. It's a sort of account ID
            -DisplayName       => Name as showns in the active directory explorer
            -GivenName         => First name of the user
            -Initials          => First letter of firstname combined with first letter of lastname
            -Surname           => User's Lastname
            -UserPrincipalName => username used for login. The standard format (<user>@<DNS-domain-name>) is not respected here for simplicity
            -EmailAddress      => ---
            -Department        => Name of the departement the user belongs to. Exemple: Marketing
            -AccountPassword   => ---
            -Title             => Job title
            -Company           => ---
            -Path              => The path to the OU the user has to be inserted into
        
        #>

        New-ADUser `
            -Name $displayName `
            -SamAccountName $displayName `
            -DisplayName $displayName `
            -GivenName $userData.Firstname `
            -Initials $userData.Initial `
            -Surname $userData.Lastname `
            -UserPrincipalName $userData.Username`
            -EmailAddress $userData.Email `
            -Department $userData.Department `
            -AccountPassword(ConvertTo-SecureString $userData.Password -AsPlainText -Force) `
            -Title $userData.JobTitle `
            -Company $userData.Company `
            -Path $userData.OU `

            Write-Host -ForegroundColor green "L'utilisateur '$displayName' a été créé avec succès !"
    }
}