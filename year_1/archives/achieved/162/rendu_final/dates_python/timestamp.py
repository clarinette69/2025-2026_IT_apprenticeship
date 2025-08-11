# Importation des modules nécessaires : pandas pour la manipulation de données,
# random pour la génération de nombres aléatoires, et datetime pour manipuler les objets de date et de temps.
import pandas as pd
import random
from datetime import datetime, timedelta

# Définition d'une fonction pour générer une date aléatoire entre deux dates données.
# La fonction retourne un objet datetime en ajoutant un délai (timedelta) aléatoire à la date de départ (start).
def random_date(start, end):
    return start + timedelta(
        seconds=random.randint(0, int((end - start).total_seconds())))

# Définition des dates de départ et de fin entre lesquelles les dates aléatoires seront générées.
start_date = datetime(2023, 1, 1)
end_date = datetime(2023, 12, 31)

# Génération d'une liste de dates aléatoires pour deux colonnes.
# Utilisation de la fonction random_date pour créer 5 dates aléatoires, formatées en ISO 8601, pour chaque colonne.
random_dates_column1 = [random_date(start_date, end_date).strftime('%Y-%m-%dT%H:%M:%S') for _ in range(5)]
random_dates_column2 = [random_date(start_date, end_date).strftime('%Y-%m-%dT%H:%M:%S') for _ in range(5)]

# Création d'un DataFrame pandas avec deux colonnes, chacune contenant la liste de dates aléatoires générée précédemment.
df_two_columns = pd.DataFrame({
    'Column 1': random_dates_column1,
    'Column 2': random_dates_column2
})

# Spécification du chemin du fichier CSV où le DataFrame sera enregistré.
csv_filename_two_columns = 'C:\\Users\\logod\\Desktop\\EPSIC\\module_162\\random_dates_two_columns.csv'

# Exportation du DataFrame au format CSV, sans inclure l'index du DataFrame dans le fichier.
df_two_columns.to_csv(csv_filename_two_columns, index=False)

# La variable csv_filename_two_columns contient le chemin du fichier CSV généré.
csv_filename_two_columns
