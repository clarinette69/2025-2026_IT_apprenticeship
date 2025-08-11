package q4_syracuse;

import java.util.Scanner;

public class Q4_Syracuse {

    public static void main(String[] args) {
        int inNombre = 0;
        Scanner sc = new Scanner(System.in);
	
	// Afficher le message d'accueil et saisie du NOMBRE
        while (inNombre<1)
        {
            System.out.println("Veuillez introduire un NOMBRE entier positif");
            
            try{
                inNombre = sc.nextInt();
            }
            
            catch (Exception e){
                System.out.println("! Veuillez introduire un NOMBRE valide !");
                
                // Vider tampon
                sc.nextLine();
            }
        }

        System.out.println("Voici la suite de Syracuse de : " + inNombre);
        
	// Répéter tant que NOMBRE est différent de 1
	while (inNombre != 1)
	{
		// Le NOMBRE est-il PAIR ?
		if ( (inNombre%2) == 0)
		{
			// Si OUI
			inNombre /=2;
		}
		else
		{
			// Si NON
			inNombre *=3;
			inNombre +=1;
		}
		
		// Afficher le NOMBRE et un CR
		System.out.print(inNombre + "   ");
	}
        System.out.println();
    }
}
