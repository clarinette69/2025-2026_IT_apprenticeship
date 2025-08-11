# demande à l'utilisateur de saisir un nombre premier
nombre = 0
while nombre <= 0:
	nombre = int(input("Merci de saisir un nombre : "))


# on test les cas spéciaux inférieur ou égale à 2 qui sont premiers
if nombre <= 2:
	print(f"Le nombre {nombre} est premier")

#sinon on test tous les diviseurs possibles
else:
	# par défaut on indique que notre nombre est premier
	estPremier = True

	#on boucle sur la moitié des diviseurs du nombre
	for i in range(2, int(nombre/2 + 1)):
		# si le nombre est divisible alors il est pas premier 
		# et on quitte la boucle
		if nombre % i == 0:
			estPremier = False
			break
	# on affiche le résultat
	if estPremier == True:
		print(f"Le nombre {nombre} est premier")
	else:
		print(f"Le nombre {nombre} n'est pas premier")