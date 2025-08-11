package ex_3;

// (C) Tony Favre-Bulle - 3 févr. 2022

import java.util.Scanner;

public class Ex_3 {

    public static void main(String[] args) {
        // Initialisation des identificateurs
	int inCompteur = 1;
	int inClassement = 1;
	double doNombre = -1;
	double doPlusGrand = 0;
        
    // Instanciation de la classe Scanner
    Scanner scan = new Scanner(System.in);
        
        // Tant que nombre est différent de 0, répèter la saisie
	while ( !(doNombre == 0) )
	{
		// Saisir un NOMBRE au clavier
		System.out.println("Veuillez introduire un nombre [ 0 ]"
                                                         + " pour quitter ]");
                

		// Récupérer et mémoriser le NOMBRE
		doNombre = scan.nextInt();;

		// Tester si le dernier NOMBRE saisi est Plus grand
		if ( doNombre > doPlusGrand )
		{
			// Si vrai
			// Remplacer / mémoriser le NOMBRE dans PLUS_GRAND
			doPlusGrand = doNombre;

			// Mémoriser le No de la saisie dans CLASSEMENT
			inClassement = inCompteur;
		}

		// Incrémenter le COMPTEUR
		inCompteur++;
	}

	// Afficher le résultat
	System.out.println("Le plus grand nombre saisi est : " + doPlusGrand
                        + " --> " + inClassement + " ERE/EME valeur saisie.");
    }
    
}
