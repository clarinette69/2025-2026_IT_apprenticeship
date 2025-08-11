package ap_no_5;

// (C) Tony Favre-Bulle - 8 févr. 2022

import java.util.Scanner;


public class AP_No_5 {

    public static void main(String[] args) {
        
        // Identificateurs (déclaration et initialisation)
	double doValeur = -1, doSomme = 0, doMoyenne = 0;
        String stSaisie;
	int inCompteur = 0;
        
        Scanner sc = new Scanner(System.in);

	// Message d'accueil & d'information
	System.out.println( "PROGRAMME POUR LE CALCUL DE MOYENNE");
	System.out.println( "-----------------------------------");
	System.out.println( "Introduire la valeur [ 0 ] pour lancer "
                                                + "le calcul de la moyenne");
	System.out.println();

	//Saisie des notes
	while ( !(doValeur == 0) )
	{
		// Incrémenter le compteur
		inCompteur++;

		// Saisie d'une valeur
		System.out.println( "VEUILLEZ INTRODUIRE LA NOTE No : "
                                                            + inCompteur);
		try{
                    stSaisie = sc.nextLine();
                    doValeur = Double.parseDouble(stSaisie);
                    System.out.println();
                }
                catch (Exception e){
                    System.out.println("! Veuillez saisir une note valide !");
                }

		// Tester la valeur saisie
		if ( (doValeur >=1 ) && (doValeur <=6) )
		{
			// Additionner la valeur
			doSomme += doValeur; // doSomme = doSomme + doValeur
		}
		else
		{
			// Annuler l'enregistrement de la saisie
			inCompteur--;
		}
	}

	// Contrôler l'éventuelle division par zéro (pas de note saisie)
	if ( !(inCompteur <1) )
	{
		System.out.println("Somme : " + doSomme + "      Compteur : "
                                                                + inCompteur);
		// Calculer de la moyenne
		doMoyenne = doSomme / inCompteur;

		// Arrondir au demi point
		doMoyenne = Arrondir(doMoyenne);

		// Afficher la moyenne
		System.out.println( "VOTRE MOYENNE VAUT : " + doMoyenne);

		// Afficher le commentaire appropié
		if (doMoyenne <= 3.5)
		{
			System.out.println( "MOYENNE INSUFFISANTE");
		}
		else if (doMoyenne <= 5.0)
		{
			System.out.println( "BONNE MOYENNE");
		}
		else
		{
			System.out.println( "TRES BONNE MOYENNE !");
		}
	}
	else
	{
		System.out.println( "VEUILLEZ SAISIR AU MOINS UNE NOTE !");
	}
    }

    // Méthode du calcul de l'arrondi au demi point
    public static double Arrondir (double doValeur){
        doValeur = ( (int)((doValeur * 2 ) + 0.5) );
	doValeur /= 2;
        return(doValeur);
    }
}