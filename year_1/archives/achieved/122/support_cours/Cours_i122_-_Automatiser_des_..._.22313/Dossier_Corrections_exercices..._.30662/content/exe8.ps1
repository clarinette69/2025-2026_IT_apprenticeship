$disk = Get-Volume

echo "étape 1 nom des volume : " $disk.DriveLetter

echo "étape 2 Taille des disques : " $disk.Size


echo "étape 3 Taille restante des disques : " $disk.SizeRemaining


echo "étape 4 système de fichier des disques : " $disk.FileSystemType
