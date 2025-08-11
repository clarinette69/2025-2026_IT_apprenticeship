package ex_1;

// (C) Tony Favre-Bulle - 3 févr. 2022

import java.util.Scanner;

public class Ex_1 {

    public static void main(String[] args) {
        
        // Déclatation des identificateurs
	int inValeur = 0;
	int inResultat = 0;
        
    // Instanciation de la classe Scanner
    Scanner scan = new Scanner(System.in);

	// Saisir une valeur et la vérifier
	while ( (inValeur < 1) || (inValeur > 127) )
	{
		//Afficher un message
		System.out.println("Veuillez introduire une valeur [1 - 127]");

		// Récupérer la saisie de l'utilisateur et mémoriser
                inValeur = scan.nextInt();
	}

	// Affichage du choix
	System.out.println("La valeur choisie est : " + inValeur);

	// Calcul du modulo
	inResultat = inValeur % 2;

	// Tester si PAIR ou IMPAIR
	if ( inResultat == 0)
	{
		// Si VRAI
		System.out.println("La valeur choisie est PAIRE !!!");
	}
	else
	{
		// Si FAUX
		System.out.println("La valeur choisie est IMPAIRE !!!");
	}
    }
    
}
