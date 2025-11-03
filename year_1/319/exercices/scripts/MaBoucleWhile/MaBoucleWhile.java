package MaBoucleWhile;                  // Le fichier appartient au paquetage MaBoucleWhile

import java.util.Scanner;               // Import de la classe Scanner pour lire au clavier

public class MaBoucleWhile {            // Déclaration de la classe

    public static void main(String[] args) { // Point d'entrée du programme

        Scanner clavier = new Scanner(System.in); // Crée un Scanner pour lire depuis le clavier
        System.out.print("Entrez la valeur de i : "); // Invite l'utilisateur à saisir une valeur
        int i = clavier.nextInt();                  // Lit un entier tapé par l'utilisateur et le stocke dans i

        while (i < 10) {                            // Tant que i est strictement inférieur à 10...
            System.out.println("bonjour " + i);     // ...affiche "bonjour" suivi de la valeur actuelle de i
            // ⚠️ i n'est jamais modifié ici → boucle infinie si i < 10
        }                                           // Fin de la boucle while

        // Bonne pratique : penser à fermer le Scanner (non présent dans le code original)
        // clavier.close();
    // On ferme le Scanner pour libérer les ressources utilisées (bonne pratique en Java)
    clavier.close();
    } // Fin de main

} // Fin de classe
