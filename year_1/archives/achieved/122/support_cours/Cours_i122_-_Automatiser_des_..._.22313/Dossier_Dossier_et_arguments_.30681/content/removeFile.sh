#! /bin/bash
#on parcourt tous les dossiers dans d
for d in */; do
	# on rentre dans le dossier
	cd "$d"
	#on boucle sur les éléments du dossier
	for f in *; do
		#test si c'est un fichier
		if [ -f $f ]
		then
			# on supprime le fichier
			rm $f
		fi
	done
	#on ressort du dossier
	cd ..
done
