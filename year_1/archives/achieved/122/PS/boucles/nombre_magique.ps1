# Initialisation des scores
$userScore = 0
$computerScore = 0

# Boucle principale pour jouer plusieurs manches
while ($true) {
    # Affichage des choix possibles
    Write-Host "Choisissez votre coup :"
    Write-Host "1. Pierre"
    Write-Host "2. Papier"
    Write-Host "3. Ciseaux"

    # L'utilisateur choisit son coup en entrant un numéro
    $choice = Read-Host "Entrez le numéro de votre coup (1/2/3):"

    # Le script choisit aléatoirement un coup pour l'ordinateur
    $computerChoice = Get-Random -Minimum 1 -Maximum 4

    # Définir les choix possibles
    $rock = 1
    $paper = 2
    $scissors = 3

    # Afficher le choix de l'utilisateur et de l'ordinateur
    Write-Host "Vous avez choisi :"
    switch ($choice) {
        $rock { Write-Host "Pierre" }
        $paper { Write-Host "Papier" }
        $scissors { Write-Host "Ciseaux" }
        default { Write-Host "Choix invalide" }
    }

    Write-Host "L'ordinateur a choisi :"
    switch ($computerChoice) {
        $rock { Write-Host "Pierre" }
        $paper { Write-Host "Papier" }
        $scissors { Write-Host "Ciseaux" }
    }

    # Déterminer le gagnant et mettre à jour les scores
    if ($choice -eq $computerChoice) {
        Write-Host "C'est une égalité !"
    } elseif (
        ($choice -eq $rock -and $computerChoice -eq $scissors) -or
        ($choice -eq $paper -and $computerChoice -eq $rock) -or
        ($choice -eq $scissors -and $computerChoice -eq $paper)
    ) {
        Write-Host "Vous avez gagné !"
        $userScore++
    } else {
        Write-Host "L'ordinateur a gagné."
        $computerScore++
    }

    # Afficher les scores actuels
    Write-Host "Score actuel :"
    Write-Host "Utilisateur : $userScore"
    Write-Host "Ordinateur : $computerScore"

    # Demander à l'utilisateur s'il souhaite jouer une autre manche
    $playAgainInput = Read-Host "Voulez-vous jouer une autre manche ? (Oui/Non)"
    if ($playAgainInput -ne "Oui") {
        break # Sortir de la boucle si l'utilisateur ne souhaite pas jouer à nouveau
    }
}
