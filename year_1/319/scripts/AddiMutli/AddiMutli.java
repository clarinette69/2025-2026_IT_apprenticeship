import java.util.Scanner;
// Importation de la classe Scanner depuis la bibliothèque standard de Java.
// Scanner permet de lire des entrées (clavier, fichiers, etc.)
// Ici, on l’utilise pour que l’utilisateur saisisse des valeurs au clavier.

public class AddiMutli {
    // Définition d’une classe publique nommée AddiMutli (le nom doit correspondre au fichier: AddiMutli.java).
    // En Java, tout code doit être contenu dans une classe.

	public static void main(String[] args) {//
	// Méthode principale : c’est le point d’entrée du programme.
    // "static" → la méthode peut être appelée sans créer d’objet de la classe.
    // "void" → la méthode ne retourne rien.
    // "String[] args" → tableau de chaînes de caractères contenant les arguments passés au programme en ligne de commande.

	Scanner clavier = new Scanner(System.in);
    // Création d’un objet Scanner nommé "clavier" qui lit les entrées tapées par l’utilisateur dans la console (System.in).

	System.out.println("Entrez la valeur de a : ");
    // Affiche un texte à l’écran puis passe à la ligne.

    int a = clavier.nextInt();
    // Lit le prochain **entier** tapé au clavier et le stocke dans la variable "a".
    // Attention : si l’utilisateur tape autre chose qu’un entier, le programme plantera (InputMismatchException).

    System.out.println("Entrez la valeur de b : ");//Affiche le text entre "" et fait un retour à la ligne
    int b = clavier.nextInt();//enregistre le prochain charactère entré sur le clavier comme étant le contenu de b
    
    int somme = a + b;// enregistre le resultat de l'addition des deux chiffres dans la variable "somme". Seul les int sont accepté
    int produit = a * b;// enregistre le resultat de la multiplication des deux chiffres dans la variable "produit". Seul les int sont accepté
    System.out.println("La somme de a plus b vaut: "+somme);//Affiche le text entre "" et le contenu de la variable somme fait un retour à la ligne
    System.out.println("Le produit de a par b vaut: "+produit);//Affiche le text entre "" et le contenu de la variable produit et fait un retour à la ligne
    
}//
}//
