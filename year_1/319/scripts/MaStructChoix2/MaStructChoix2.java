import java.util.Scanner;


public class MaStructChoix2 {
	
	
	public static void main(String[] args) {
		
		Scanner clavier = new Scanner(System.in);
		System.out.print("Entrez la valeur de n supérieure à 1 ou inférieure à 10: ");
	    int n = clavier.nextInt();

	    if ( (n>=1) || (n<=10) )  { 
	    	System.out.print("correct ");
	   
	    } else {
	    	
	    	System.out.print("incorrect");
	    	
	    }
	   
	    
	     // Bonne pratique : fermer le scanner
        clavier.close();
	}
}