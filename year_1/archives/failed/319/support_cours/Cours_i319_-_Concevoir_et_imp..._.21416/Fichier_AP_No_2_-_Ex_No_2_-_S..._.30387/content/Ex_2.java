package ex_2;

// (C) Tony Favre-Bulle - 3 févr. 2022

import java.util.Scanner;

public class Ex_2 {

    public static void main(String[] args) {
        
        // Déclatation des identificateurs
	int inValeur = 0;
        int inSomme = 0;
        int inNombre = 0;
        
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
        // Récupération de la VALEUR saisie
	inNombre = inValeur;
	
	while ( inNombre >= 1 ) // Tant que NOMBRE >= 1
	{
		// Mémoriser SOMME = SOMME + NOMBRE
		inSomme += inNombre; // Idem que inSomme = inSomme + inNombre


		// Décrémenter NOMBRE de 1
		inNombre --; // Idem que inNombre = inNombre - 1
	}
        // Autre alternative (par calcul)
        //inSomme = (inNombre*(inNombre+1)/2);
	
	// Afficher «Le résultat est :», afficher la SOMME
	System.out.println("La somme continue vaut : " + inSomme);
    }
}
