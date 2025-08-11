#!/bin/bash

echo "quel mot souhaitez-vous rechercher"
read recherche
echo "Recherche du mot : $recherche dans le fichier.txt"

grep "$recherche" fichier.txt

