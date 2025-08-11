import argparse
import os
import sys

def verify_file(filepath):
    # Vérifie si le fichier existe et est un fichier régulier.
    if not os.path.isfile(filepath):
        print(f"Le fichier spécifié n'existe pas: {filepath}")
        sys.exit(1)
    return filepath

def main():
    # Configuration de l'analyseur d'arguments
    parser = argparse.ArgumentParser(description="Script de chiffrement Vigenère")
    parser.add_argument('fichierEntree', type=verify_file, help='Définit le fichier d\'entrée qui sera chiffré ou déchiffré')
    parser.add_argument('Clé', help='Définit la clé qui sera utilisée pour chiffrer ou déchiffrer')
    parser.add_argument('fichierSortie', help='Définit le fichier de sortie où le résultat sera stocké')
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('-c', '--chiffrement', action='store_true', help='Permet de spécifier l\'action de chiffrement')
    group.add_argument('-d', '--déchiffrement', action='store_true', help='Permet de spécifier l\'action de déchiffrement')

    # Analyse des arguments
    args = parser.parse_args()

    # Déterminer l'action à effectuer
    if args.chiffrement:
        action = 'chiffrement'
    elif args.déchiffrement:
        action = 'déchiffrement'
    
    # À ce stade, args.fichierEntree, args.Clé, args.fichierSortie, et l'action sont disponibles
    print(f"Fichier d'entrée sélectionné: {args.fichierEntree}")
    print(f"Clé de chiffrement/déchiffrement: {args.Clé}")
    print(f"Fichier de sortie sélectionné: {args.fichierSortie}")
    print(f"Action choisie: {action}")

if __name__ == "__main__":
    main()
	
def chiffre_vigenere(texte_clair, cle):
    cle = cle.lower()  # La clé doit être en minuscules pour correspondre aux indices alphabétiques
    cle_complete = ""
    while len(cle_complete) < len(texte_clair):
        cle_complete += cle
    cle_complete = cle_complete[:len(texte_clair)]
    
    texte_chiffre = ""
    for i in range(len(texte_clair)):
        if texte_clair[i].isalpha():  # On ne chiffre que les lettres alphabétiques
            decalage = ord(cle_complete[i]) - ord('a')
            if texte_clair[i].islower():
                lettre_chiffree = chr((ord(texte_clair[i]) - ord('a') + decalage) % 26 + ord('a'))
            else:  # C'est une majuscule
                lettre_chiffree = chr((ord(texte_clair[i]) - ord('A') + decalage) % 26 + ord('A'))
            texte_chiffre += lettre_chiffree
        else:
            texte_chiffre += texte_clair[i]  # Les non-lettres sont ajoutées telles quelles
    return texte_chiffre
