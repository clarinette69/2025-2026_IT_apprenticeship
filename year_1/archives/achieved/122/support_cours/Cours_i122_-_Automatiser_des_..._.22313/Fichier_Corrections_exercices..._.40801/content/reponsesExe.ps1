
#Exercice 1

#New-Variable -Name PI -Value 3.14 -option Constant
[double]$rayon = Read-Host "Merci de saisir le rayon du cercle en cm "
$aire = $PI * $rayon * $rayon
$perim = 2* $PI * $rayon

Write-Host "Le permiètre du cercle : $perim cm et l'aire du cercle : $aire cm"





#Exercice 2

[int]$no1 = Read-Host "Merci de saisir un nombre 1 entier"
[int]$no2 = Read-Host "Merci de saisir un nombre 2 entier"

# Opérateurs de comparaison
$estInf = $no1 -lt $no2
$estSup = $no1 -gt $no2
$estEgal = $no1 -eq $no2

Write-Host "Le nombre 1 par rapport au nombre 2 Est égal: $estEgal, Est inférieur: $estInf, Est supérieur: $estSup"




#Exercice 3
$bool1 = $true
$bool2 = $false

# Opérateurs logiques
$rET = $bool1 -and $bool2
$rOU = $bool1 -or $bool2
$rNon = -not $bool1

Write-Host "Exercices 3 résultat des opérations logiques : ET: $rET, OU: $rOU, NON: $rNon"


