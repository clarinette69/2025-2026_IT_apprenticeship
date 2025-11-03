import java.util.Scanner;
public class Sapin{
    
    private static final Scanner clavier = new Scanner(System.in);
    public static void main(String[] args){

        System.out.print("Entrez le nombre de lignes du sapin : ");
        int n = clavier.nextInt();
        for (int i = 0; i < n; i=i+1) {
                // ecrit les espaces avant le sapin
                for (int j = 0; j <= n - i-1; j=j+1) {
                    System.out.print(" ");

                }
                // ecrit les etoiles du triangle
                for (int k = 0; k <= 2*i; k=k+1) {
                        System.out.print("*");
                }
                // retour a la ligne
                System.out.println();
        }
    }
}