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
    
    def chiffre_vigenere(texte_clair, cle):
    # ... (le reste de la fonction reste le même)

if __name__ == "__main__":
    texte_clair = "Ceci est un texte clair"
    cle = "clesecrete"
    texte_chiffre = chiffre_vigenere(texte_clair, cle)
    print(f"Texte clair: {texte_clair}")
    print(f"Texte chiffre: {texte_chiffre}")
r5
