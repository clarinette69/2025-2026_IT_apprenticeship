package Intervalle;

import java.util.Scanner;

public class Intervalle {
    	public static void main(String[] args) {
		
		Scanner clavier = new Scanner(System.in);
		System.out.print("Entrez un réel: ");//entrer un nombre réel
	    int input = clavier.nextInt();//stocker ce nombre entier dans la viriable a

	    if ( input==0)  { 
	    	System.out.print("le nombre est "+ input +"et est pair");
	   
	    } else if (input>0) {
	    	
	    	System.out.print("Le nombre est positif");

	    }else if (input<0){
            System.out.print("Le nombre est négatif");

        }if (input % 2 == 0) {
            System.out.println("pair");
        } else {
            System.out.println("impair");
        }
	    // Bonne pratique : fermer le scanner
        clavier.close();
	}
}
