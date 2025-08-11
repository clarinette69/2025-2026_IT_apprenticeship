# Demander à l'utilisateur de saisir un nom de fichier
$nomFichier = Read-Host "Entrez le nom du fichier (sans extension)"

# Ajouter l'extension .txt au nom du fichier
$nomFichierAvecExtension = $nomFichier + ".txt"

# Créer le fichier texte
New-Item -Path $nomFichierAvecExtension -ItemType File

# Afficher le chemin complet du fichier créé
Write-Host "Le fichier a été créé : $PWD\$nomFichierAvecExtension"

# Afficher le contenu du fichier
Get-Content $nomFichierAvecExtension
