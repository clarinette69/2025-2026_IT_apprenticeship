cp .\Exercice3.txt "copieExercice3.txt" 
echo "L'étape 1 : la copie s'est bien déroulée !"

$valeur = "Exercice3LeRetour.txt" 
move  .\Exercice3.txt $valeur
echo "L'étape 2 : le rename s'est bien déroulée !"


$link = "Exercice3LeRetour"
md "Exercice3LeRetour"
move $valeur -Destination $link

