[int]$adversaire = Get-Random -Minimum 1 -Maximum 3

Write-Host "`nBienvenue au jeu du Shifumi !`n"
Write-Host "1: Feuille      2: Caillou      3: Ciseaux`n"

[int]$joueur = Read-Host "Veuillez choisir une action : "

If (($adversaire -eq 1) -and ($joueur -eq 1)) 
{
    Write-Host " CPU : Feuille     VS    Feuille : Joueur"
    Write-Host " Egalité !"
}
Elseif (($adversaire -eq 1) -and ($joueur -eq 2))
{
    Write-Host " CPU : Feuille     VS    Caillou : Joueur"
    Write-Host " CPU Gagne !"
}
Elseif (($adversaire -eq 1) -and ($joueur -eq 3))
{
    Write-Host " CPU : Feuille     VS    Ciseaux : Joueur"
    Write-Host " Joueur Gagne !"
}
Elseif (($adversaire -eq 2) -and ($joueur -eq 1))
{
    Write-Host " CPU : Caillou     VS    Feuille : Joueur"
    Write-Host " Joueur Gagne !"
}
Elseif (($adversaire -eq 2) -and ($joueur -eq 2))
{
    Write-Host " CPU : Caillou     VS    Caillou : Joueur"
    Write-Host " Egalité !"
}
Elseif (($adversaire -eq 2) -and ($joueur -eq 3))
{
    Write-Host " CPU : Caillou     VS    Ciseaux : Joueur"
    Write-Host " CPU Gagne !"
}
Elseif (($adversaire -eq 3) -and ($joueur -eq 1))
{
    Write-Host " CPU : Ciseaux     VS    Feuille : Joueur"
    Write-Host " CPU Gagne !"
}
Elseif (($adversaire -eq 3) -and ($joueur -eq 2))
{
    Write-Host " CPU : Ciseaux     VS    Caillou : Joueur"
    Write-Host " Joueur Gagne !"
}
Elseif (($adversaire -eq 3) -and ($joueur -eq 3))
{
    Write-Host " CPU : Ciseaux     VS    Ciseaux : Joueur"
    Write-Host " Egalité !"
}