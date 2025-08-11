#!/bin/bash

# Saisie de l'utilisateur
echo "Quelle est la largeur : "
read largeur
echo "Quelle est la longueur : "
read longueur

# calcul pour l'air et le perimètre
p=$((2*$largeur+2*$longueur))
aire=$(($largeur*$longueur))

#Affichage
echo "Le périmètre est de : $p"
echo "L'aire est de : $aire"
