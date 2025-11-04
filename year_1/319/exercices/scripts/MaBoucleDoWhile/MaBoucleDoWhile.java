package MaBoucleDoWhile;                 // Le fichier appartient au paquetage MaBoucleDoWhile

import java.util.Scanner;                // Import de Scanner pour la saisie

public class MaBoucleDoWhile {           // Déclaration de la classe

    public static void main(String[] args) { // Point d'entrée

        Scanner clavier = new Scanner(System.in); // Création du Scanner
        System.out.print("Entrez la valeur de i : "); // Demande une valeur à l'utilisateur
        int i = clavier.nextInt();                 // Stocke la valeur saisie dans i

        do {                                      // Démarre une boucle do...while (s'exécute AU MOINS une fois)
            System.out.println("bonjour " + i);   // Affiche "bonjour" + i
            i = i + 1;                            // Mise à jour pour avancer vers la sortie de boucle
        } while (i < 10);                         // Condition testée après l'itération

        // Bonne pratique : penser à fermer le Scanner (non présent dans le code original)
        // clavier.close();
        // On ferme le Scanner pour libérer les ressources utilisées (bonne pratique en Java)
        clavier.close();
    } // Fin de main

} // Fin de classe
