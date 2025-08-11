import argparse  # Importe le module argparse pour analyser les arguments de la ligne de commande.
import os  # Importe le module os pour interagir avec le système d'exploitation.
import sys  # Importe le module sys pour accéder à certaines variables utilisées ou maintenues par l'interpréteur.

# Définit une fonction pour vérifier l'existence et la validité du fichier d'entrée.
def verify_file(filepath):
    # Vérifie si le chemin spécifié est un fichier existant.
    if not os.path.isfile(filepath):
        # Affiche un message d'erreur si le fichier n'existe pas.
        print(f"Le fichier spécifié n'existe pas: {filepath}")
        # Quitte le script avec un code d'erreur.
        sys.exit(1)
    # Retourne le chemin du fichier si le fichier existe.
    return filepath

# Définit la fonction de chiffrement Vigenère.
def chiffre_vigenere(texte_clair, cle):
    # Nettoie la clé pour ne conserver que les lettres et la convertit en minuscules.
    cle = ''.join(filter(str.isalpha, cle)).lower()

    # Étend la clé pour qu'elle soit aussi longue que le texte à chiffrer.
    cle_etendue = (cle * (len(texte_clair) // len(cle) + 1))[:len(texte_clair)]

    # Initialise une chaîne vide pour le texte chiffré.
    texte_chiffre = ""
    # Initialise un indice pour parcourir la clé étendue.
    j = 0

    # Boucle sur chaque caractère du texte clair.
    for i in range(len(texte_clair)):
        # Récupère le caractère à l'indice i.
        char = texte_clair[i]
        # Vérifie si le caractère est alphabétique.
        if char.isalpha():
            # Calcule le décalage à partir de la clé étendue.
            decalage = ord(cle_etendue[j]) - ord('a')
            # Chiffre les minuscules.
            if char.islower():
                texte_chiffre += chr((ord(char) - ord('a') + decalage) % 26 + ord('a'))
            else:  # Chiffre les majuscules.
                texte_chiffre += chr((ord(char) - ord('A') + decalage) % 26 + ord('A'))
            # Incrémente l'indice de la clé après le chiffrement d'une lettre.
            j += 1
        else:
            # Ajoute le caractère non-alphabétique tel quel.
            texte_chiffre += char

    # Retourne le texte chiffré.
    return texte_chiffre

# Définit la fonction principale qui sera exécutée lors du lancement du script.
def main():
    # Crée un analyseur d'arguments pour le script.
    parser = argparse.ArgumentParser(description="Script de chiffrement Vigenère")
    # Ajoute un argument pour le fichier d'entrée avec vérification de l'existence du fichier.
    parser.add_argument('fichierEntree', type=verify_file, help='Définit le fichier d\'entrée qui sera chiffré')
    # Ajoute un argument pour la clé de chiffrement.
    parser.add_argument('Clé', help='Définit la clé qui sera utilisée pour chiffrer')
    # Ajoute un argument pour le fichier de sortie où sera stocké le résultat.
    parser.add_argument('fichierSortie', help='Définit le fichier de sortie où le résultat sera stocké')
    # Ajoute un argument pour spécifier l'action de chiffrement, requis dans ce cas.
    parser.add_argument('-c', '--chiffrement', action='store_true', help='Permet de spécifier l\'action de chiffrement', required=True)

    # Analyse et récupère les arguments de la ligne de commande.
    args = parser.parse_args()

    # Ouvre et lit le contenu du fichier d'entrée.
    with open(args.fichierEntree, 'r', encoding='utf-8') as file:
        texte_clair = file.read()

    # Appelle la fonction de chiffrement avec le texte clair et la clé.
    texte_chiffre = chiffre_vigenere(texte_clair, args.Clé)

    # Ouvre et écrit le texte chiffré dans le fichier de sortie.
    with open(args.fichierSortie, 'w', encoding='utf-8') as file:
        file.write(texte_chiffre)

    # Affiche des informations de confirmation dans la console.
    print(f"Fichier d'entrée sélectionné: {args.fichierEntree}")
    print(f"Clé de chiffrement: {args.Clé}")
    print(f"Fichier de sortie sélectionné: {args.fichierSortie}")

# Point d'entrée du script. Si le script est exécuté directement, appelle la fonction main().
if __name__ == "__main__":
    main()
