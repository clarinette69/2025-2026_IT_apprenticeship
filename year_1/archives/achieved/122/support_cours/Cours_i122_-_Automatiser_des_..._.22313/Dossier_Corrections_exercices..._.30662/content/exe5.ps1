$process = Get-Process -Name "notepad"

echo "étape 2 affichage des méthodes de processus : "

echo $process | Get-Member -MemberType Method

echo "étape 3 affichage de la description du processus : " $process.Description

echo "étape 3 affichage de la description du processus : " $process.Path