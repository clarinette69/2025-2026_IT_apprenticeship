package Pret;


import java.util.Scanner;


public class Pret {
    private static Scanner clavier = new Scanner(System.in);
    
    public static void main(String[] args)
        {
            double S = 0.0; //Déclaration d'une variable de type double (pour avoir les centimes) pour montant total du prêt
            do { //début d'une boucle do while
                System.out.print("Somme prêtée (S > 0) : "); //Afin de s'assurer que l'utilisateur entre une valeure suppérieure à 0.
                S = clavier.nextDouble(); //Assignation de la valeure entrée par l'utilisateur à la variable du  montant total
            } while (S <= 0.0);//cette boucle continuera de tourner tant que l'utilisateur n'aura pas entré un valeur suppérieur à 0
 
            double R = 0.0; //Déclaration d'une variable de type double (pour avoir les centimes) pour monant remboursé chaque mois
            do {//début d'une boucle do while
                System.out.print("Montant fixe remboursé chaque mois (R > 0) : ");//Afin de s'assurer que l'utilisateur entre une valeure suppérieure à 0.
                R =clavier.nextDouble();//Assignation de la valeure entrée par l'utilisateur à la variable du montant rendu chaque mois
            } while (R <= 0.0);//cette boucle continuera de tourner tant que l'utilisateur n'aura pas entré un valeur suppérieur à 0
 
            double T = 0.0;//Déclaration d'une variable de type double pour taux d'intérêt mensuel
            do {//début d'une boucle do while
                System.out.print("Taux d'intérêt en % (0 < T < 100) : ");//Afin de s'assurer que l'utilisateur entre une valeure suppérieure à 0.
                T = clavier.nextDouble();//Assignation de la valeure entrée par l'utilisateur à la variable du tauxd'intérêt mensuel
            } while ( (T <= 0.0) || (T >= 100.0) );//cette boucle continuera de tourner tant que l'utilisateur n'aura pas entré un valeur suppérieur à 0
            
         /*******************************************
         * Completez le programme a partir d'ici.
         *******************************************/
            T = T / 100; // transformation du pourcentage en valeur décimale
            double cumul = 0.0; // total des intérêts encaissés
            double SR = S; // capital restant à rembourser
            int n = 0; // nombre de mois déjà payés

            while (SR > 0.0) {
                double interet = SR * T; // intérêts calculés sur le capital restant
                cumul = cumul + interet;
                SR = SR + interet - R; // ajout des intérêts puis retrait du remboursement mensuel
                n = n + 1;

                if (SR < 0.0) {
                    SR = 0.0; // aucune somme négative ne doit rester
                }

                System.out.println(n + ": Somme Restant = " + SR + " Cumul = " + cumul);

                if (R <= interet && SR > 0.0) {
                    System.out.println("Le remboursement mensuel est insuffisant pour couvrir les intérêts.");
                    break;
                }
            }
            System.out.println("Somme des intêrets encaissés : " + cumul + " (Sur " + n + " mois)");
            
        /*******************************************
         * Ne rien modifier apres cette ligne.
         *******************************************/    
        }

}
