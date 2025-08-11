import os


annee = int(input("Merci de saisir une année : "))


# test si année est bissextile :
if (annee % 4 == 0) and (annee % 100 != 0) or (annee % 400 == 0) :
	print (f"L'année {annee} est une année bissextile.")
else :
	print (f"L'année {annee} est une année non bissextile.")