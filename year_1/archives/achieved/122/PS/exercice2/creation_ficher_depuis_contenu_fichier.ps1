# Lire le contenu du fichier Exercice2.txt
$contenuFichier = Get-Content -Path "C:/Users/logod/Desktop/EPSIC/module_122/Exercice2.txt"

# Spécifier le chemin de base où vous voulez créer les dossiers
$cheminDeBase = "C:/Users/logod/Desktop/EPSIC/module_122/"

# Créer un dossier pour chaque ligne
foreach ($ligne in $contenuFichier) {
    New-Item -ItemType Directory -Path (Join-Path $cheminDeBase $ligne) -Force
}
