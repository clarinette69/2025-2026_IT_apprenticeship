import java.util.Scanner;

public class Permut {

    public static void main(String[] args) {
        // Crée un objet Scanner pour lire les entrées clavier
        Scanner clavier = new Scanner(System.in);

        // Demande à l'utilisateur un chiffre x
        System.out.print("Entrez une un chiffre x:");
        int xOriginal = clavier.nextInt();

        // Demande à l'utilisateur un chiffre y
        System.out.print("Entrez un chiffre y:");
        int yOriginal = clavier.nextInt();

        int z = 1;
        
        z = xOriginal;
        int x = yOriginal;
        int y = z;

        // Affiche le résultat
        System.out.println("Avant permutation:");
        System.out.println("x :"+xOriginal);
        System.out.println("y :"+yOriginal);
        // Affiche le résultat
        System.out.println("Après permutation:");
        System.out.println("x :"+x);
        System.out.println("y :"+y);

        // Bonne pratique : fermer le scanner
        clavier.close();
    }
}
