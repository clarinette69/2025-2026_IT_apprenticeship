import java.util.Scanner;

public class StaticArray1 {

    public static void main(String[] args) {
        int[][] y = new int[3][2];     // 3 lignes, 2 colonnes
        Scanner sc = new Scanner(System.in);

        // 1) Remplir le tableau avec les valeurs de l'utilisateur
        for (int i = 0; i < y.length; i++) {          // parcourt les lignes
            for (int j = 0; j < y[i].length; j++) {   // parcourt les colonnes de cette ligne
                System.out.print("Entrez y[" + i + "][" + j + "] : ");
                y[i][j] = sc.nextInt();               // lit un entier saisi
            }
        }

        // 2) Afficher les longueurs de chaque ligne (comme ton code d'origine)
        System.out.println(y[0].length);
        System.out.println(y[1].length);
        System.out.println(y[2].length);
        System.out.println();

        // 3) Afficher tout le tableau (en grille)
        for (int i = 0; i < y.length; i++) {
            for (int j = 0; j < y[i].length; j++) {
                System.out.print(y[i][j] + " ");
            }
            System.out.println(); // fin de ligne
        }

        sc.close(); // bonne pratique
    }
}
