// On importe Scanner pour lire la saisie clavier
import java.util.Scanner;

// Classe du programme
public class AnalyseNombre {

    // Point d'entrée du programme
    public static void main(String[] args) {

        // Création d'un Scanner pour lire au clavier
        Scanner clavier = new Scanner(System.in);

        // Invite l'utilisateur à entrer un nombre entier
        System.out.print("Entrez un nombre entier : ");

        // Lit l'entier saisi et le stocke dans la variable 'n'
        int n = clavier.nextInt();

        // Test 1 du diagramme : n == 0 ?
        if (n == 0) {

            // Si oui : afficher que le nombre est 0 et qu'il est pair (cas terminal du diagramme)
            System.out.println("Le nombre est 0 et est pair.");

        } else {

            // Sinon (n != 0) on poursuit : Test 2 du diagramme : n > 0 ?
            if (n > 0) {

                // Si oui : afficher que le nombre est positif
                System.out.println("Nombre positif.");

            } else {

                // Si non : afficher que le nombre est négatif
                System.out.println("Nombre négatif.");
            }

            // Ensuite, quel que soit le signe (puisque n != 0), on teste la parité : n % 2 == 0 ?
            if (n % 2 == 0) {

                // Si reste 0 → n est pair
                System.out.println("Nombre pair.");

            } else {

                // Sinon → n est impair
                System.out.println("Nombre impair.");
            }
        }

        // Bonne pratique : fermer le scanner pour libérer les ressources
        clavier.close();
    }
}
