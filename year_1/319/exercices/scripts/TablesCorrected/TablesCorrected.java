package TablesCorrected;
public class TablesCorrected {
            public static void main(String[] args) {
            System.out.println(" Tables de multiplication");
            
            for (int i = 2; i <= 10; i=i+1) {
                // \n est un saut de ligne
                    System.out.println("\n Table de " + i + " :");
                    for (int j = 1; j <= 10; j=j+1) {
                                System.out.println(" " + j + " * " + i + " = " + i*j);
                        }
                }
            }
}