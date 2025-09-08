import java.util.Scanner;

public class Age {

    public static void main(String[] args) {
        // Crée un objet Scanner pour lire les entrées clavier
        Scanner clavier = new Scanner(System.in);

        // Demande à l'utilisateur son âge
        System.out.print("Quel âge avez-vous ? ");
        int age = clavier.nextInt();

        // Demande à l'utilisateur l'année actuelle
        System.out.print("En quel année êtes-vous ? ");
        int year = clavier.nextInt();

        // Calcule l'année de naissance (ici on fixe l'année actuelle à 2025)
        int naissance = year - age;

        // Affiche le résultat
        System.out.println("Vous êtes né en " + naissance);

        // Bonne pratique : fermer le scanner
        clavier.close();
    }
}
