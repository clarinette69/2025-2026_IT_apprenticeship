import java.util.Scanner;


public class MaStructChoix1 {
	
	
	public static void main(String[] args) {
		
		Scanner clavier = new Scanner(System.in);
		System.out.print("Entrez la valeur de a : ");
	    int a = clavier.nextInt();

	    if ( a == 6)  { 
	    	System.out.print("la valeur de a est égale à 6. ");
	   
	    } else {
	    	
	    	System.out.print("la valeur de a n'est pas égale à 6. ");
	    	
	    }
	    
	    // Bonne pratique : fermer le scanner
        clavier.close();
	}
}
