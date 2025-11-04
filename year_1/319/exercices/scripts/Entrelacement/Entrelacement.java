import java.util.Scanner;

class Entrelacement {

    final private static Scanner clavier = new Scanner(System.in);
    public static void main(String[] args) {
        int[] tab1 = {1, 7, 6}; //Déclération d'un tableau de o,1,2 => donc 3 sur 3
        int taille = tab1.length; //Assignation de la  valeure de sa taille dans une variable
        int[] tab2 = new int[taille]; //Déclaration d'un second tableau de même taille que tab1 (3)

        System.out.println("Saisie du tableau : "); //Affiche le text entre ""
        // lecture du second tableau
        for(int i = 0; i < taille; ++i) {//Boucle qui s'arrête quand le conteur est à 2
            System.out.println("Entrez une valeur pour l'element " + i + " : ");//Demande à l'utilisateur d'entrer un chiffre dans chaqune des case du tableau
            tab2[i] = clavier.nextInt();
        }

        // affichage
        System.out.println("Les tableaux a entrelacer sont : ");
        for(int i = 0; i < taille; ++i) {
            System.out.print(tab1[i] + " " );
        }
        System.out.println();

        for(int i = 0; i < taille; ++i) {
            System.out.print(tab2[i] +  " " );
        }
        System.out.println();

        /*******************************************
        * Completez le programme a partir d'ici.
        *******************************************/
        // --- 2️⃣ Création d’un entier taille1 = taille(tab1) + taille(tab2) ---
        int taille1 = tab1.length + tab2.length;
        // --- 3️⃣ Initialisation de tab3 avec la taille de taille1 ---
        int [] tab3 = new int [taille1];
        // --- 4️⃣ Boucle pour remplir tab3 en entrelaçant tab1 et tab2 ---
        int position = 0;
        int tailleMax = Math.max(tab1.length, tab2.length);
        for (int i = 0; i < tailleMax; i = i + 1) {
            if (i < tab1.length) {
                tab3[position] = tab1[i];
                position = position + 1;
            }
            if (i < tab2.length) {
                tab3[position] = tab2[i];
                position = position + 1;
            }
        }

        // --- 5️⃣ Affichage du tableau fusionné ---
        System.out.println("Tableau entrelacé : ");
        for (int valeur : tab3) {
            System.out.print(valeur + " ");
        }
        System.out.println();

        
        /*******************************************
        * Ne rien modifier apres cette ligne.
        *******************************************/

    }

}
