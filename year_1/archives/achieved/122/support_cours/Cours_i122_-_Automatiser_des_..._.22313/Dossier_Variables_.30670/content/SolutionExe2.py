# Étape 1 : Demander à l'utilisateur de saisir une série de nombres
serie = input("Entrez une série de nombres, séparés par des virgules : ")

# Étape 2 : Séparer la chaîne de caractères en une liste de nombres
nombres = serie.split(",")


# Étape 3 : Trouver le nombre le plus élevé, le nombre le plus bas et calculer la moyenne
max_nombre = int(nombres[0])
min_nombre = int(nombres[0])
total = 0

# étape 4 boucler sur la liste puis sortir les nombres plus petit et plus grand
for nombre in nombres:
    # on convertit le nombe en entier
    nombre = int(nombre)

    if nombre > max_nombre:
        max_nombre = nombre
    elif nombre < min_nombre:
        min_nombre = nombre
    total += nombre
# calcul de moyenne avec la longueur de la liste
moyenne = total / len(nombres)

# Étape 5 : Afficher les résultats
print(f"Valeur min = {min_nombre} Valeur max = {max_nombre} moyenne = {moyenne}")