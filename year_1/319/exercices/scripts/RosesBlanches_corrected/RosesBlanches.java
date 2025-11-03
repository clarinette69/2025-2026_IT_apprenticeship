/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author largere
 */

import java.util.Scanner;

public class RosesBlanches {
    
    private static Scanner scanner = new Scanner(System.in);
    public static void main(String args[]) {
    // Entrée de données
    System.out.print("Combien avez-vous reçu d'argent (Frs):) ");
    int budget = scanner.nextInt();
    // Calcul du budget livres & fournitures
    int budgetLivres = budget * 3 / 4;
    int resteBudget = budget - budgetLivres;
    // Calcul du budget pour les trois autres rubriques
    int autre = resteBudget / 3;
    // Calcul du nombre de cafés
    int nbcafes = autre / 2;
    // Calcul du nombre de numéros du Flash
    int nbFlash = autre / 4;
    // Calcul du nombre de billets de TSOL
    int nbBillets = autre / 3;
    // Calcul de l'argent restant
    int reste = resteBudget- (nbcafes*2+nbFlash*4+nbBillets*3);
    //int reste = autre % 2 + autre % 4 + autre % 3 + resteBudget % 3;
    // Affichage des résultats
    System.out.println("Livres et Fournitures: " + budgetLivres + " Frs.");
    System.out.println("Vous pouvez ensuite acheter:");
    System.out.println(" " + nbcafes + " cafés");
    System.out.println(" " + nbFlash + " numéros du Flash");
    System.out.println(" " + nbBillets + " billets de métro");
    System.out.println("et il vous restera " + reste + " Frs pour les roses blanches.");
    }
}
