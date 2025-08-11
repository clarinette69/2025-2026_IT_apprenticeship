$nom = Read-Host "Saisir le nom : "
$nomC = Read-Host "Saisir le nom complet: "
$descr = Read-Host "Saisir la decription: "

New-LocalUser -Name $nom -FullName $nomC -Description $descr
Add-LocalGroupMember -Group "Utilisateurs" -Member $nom