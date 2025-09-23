// On importe la classe Scanner qui permet de lire des entrées au clavier
import java.util.Scanner;

// Déclaration de la classe principale du programme, nommée MaStructChoix
public class MaStructChoix {

    // Méthode principale, point d'entrée du programme
    public static void main(String[] args) {
        
        // Création d'un objet Scanner nommé "clavier" pour lire ce que l'utilisateur tape
        Scanner clavier = new Scanner(System.in);

        // Affiche un message à l'écran sans retour à la ligne, pour inviter l'utilisateur à entrer un nombre
        System.out.print("Entrez la valeur de a : ");

        // Lecture d'un entier saisi par l'utilisateur, puis stockage de cette valeur dans la variable a
        int a = clavier.nextInt();

        // Début d'une structure conditionnelle : si la valeur de a est strictement inférieure à 6
        if ( a < 6)  { 

            // Ce message s'affiche uniquement si la condition (a < 6) est vraie
            System.out.print("la valeur de a est inférieur à 6. ");

        // Sinon, c'est ce bloc de code qui sera exécuté
        } else {
            
            // Ce message s'affiche si la condition est fausse (donc a est supérieur ou égal à 6)
            System.out.print("la valeur de a est supérieur à 6. ");
        }

        // On ferme le Scanner pour libérer les ressources utilisées (bonne pratique en Java)
        clavier.close();
    }
}
