#! /bin/bash

read -p "Nom du fichier à analyser : "
echo $REPLY
wc < $REPLY > statFichier.txt

echo "Le nombre de lignes, mots et caractères ont été écrit dans le fichier : statFichier.txt"

