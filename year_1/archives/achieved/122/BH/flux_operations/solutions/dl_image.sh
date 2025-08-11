IMAGE_URL="https://unsplash.com/fr/photos/Bkci_8qcdvQ"

# Nom du fichier à enregistrer
FILENAME="paysage.jpg"

# Télécharger l'image
wget -O $FILENAME $IMAGE_URL

echo "Téléchargement de l'image terminé."
