$file = Get-ChildItem .\Exercice4.txt

echo "étape 1 nom du fichier :" $file.Name
echo "étape 2 taille du fichier :" $file.Length
echo "étape 3 path du fichier :" $file.FullName
echo "étape 4 extension du fichier :" $file.Extension

echo "étape 5 dernier accès du fichier :" $file.LastAccessTime

cp $file "Exercice4_bis.txt"
echo  "étape 6 copie du fichier :" $file.Name

rm $file
echo  "étape 7 suppression du fichier :" 