// Nom du fichier/classe. En Java, 1 fichier public = 1 classe principale.
// La classe sert de "boîte" qui contient notre programme.
public class StaticArray {

    // Point d'entrée du programme : l'exécution commence ici.
    // String[] args peut contenir des arguments passés depuis la ligne de commande (pas utilisé ici).
    public static void main(String[] args) {

        // 1) Déclaration et création d'un tableau (array) d'entiers de TAILLE FIXE 4.
        //    - int[] : "tableau d'int"
        //    - new int[4] : réserve de la place pour 4 valeurs (indices 0,1,2,3)
        int[] scores = new int[4];//Déclare une variable de type tableaux d'int qui fera 4 lignes

        // 2) Remplissage du tableau.
        //    ⚠️ Les indices commencent à 0 en Java (indexation "zéro-based").
        scores[0] = 1000;  // 1er élément
        scores[1] = 1500;  // 2e élément
        scores[2] = 2490;  // 3e élément
        scores[3] = 6450;  // 4e élément

        // 3) Affiche un titre avant de lister les scores.
        System.out.println("Les scores sont:");

        // 4) Boucle "for" pour parcourir tout le tableau.
        //    - i = 0 : on démarre au 1er index
        //    - i < scores.length : tant que i est plus petit que la longueur du tableau (ici 4)
        //      (ça évite de dépasser et d'avoir une erreur ArrayIndexOutOfBoundsException)
        //    - i++ : on augmente i de 1 à chaque tour
        for (int i = 0; i < scores.length; i++) {

            // 5) Affichage de chaque score.
            //    - (i + 1) : transforme l'index 0..3 en numéro "humain" 1..4
            //    - scores[i] : récupère la valeur stockée à l'index i
            //    - La concaténation (+) assemble des morceaux de texte et des nombres en une seule chaîne.
            System.out.println("joueur " + (i + 1) + ": " + scores[i]);
        }
    }
}
