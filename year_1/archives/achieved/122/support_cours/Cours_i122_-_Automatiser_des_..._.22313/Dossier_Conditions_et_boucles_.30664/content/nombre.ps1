do 
{
    # init du nombre aléatoire
    $nombreAléatoire = get-random -maximum 101
    $count = 0
    do
    {
        [int]$saisie = Read-Host "Merci de saisir un nombre compris entre 0 et 100"

        if ($saisie -gt $nombreAléatoire)
        {
            echo "Votre nombre est trop grand"
        }
        elseif ($saisie -lt $nombreAléatoire)
        {
            echo "Votre nombre est trop petit"
        }
        $count++
    
    }while($saisie -ne $nombreAléatoire)

    Write-host "Bravo vous avez trouvé le nombre aléatoire " $nombreAléatoire ", il vous a fallut " $count " essaie(s)"

    # on demande pour refaire une partie
    $partie = Read-Host "Voulez-vous refaire une partie [O] pour oui [N] pour non" 
}while ($partie -eq "O")