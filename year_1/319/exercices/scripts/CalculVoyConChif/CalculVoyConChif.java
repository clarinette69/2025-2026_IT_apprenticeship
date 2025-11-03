import java.util.Scanner; // ✅ importe la classe Scanner pour lire une saisie clavier

public class CalculVoyConChif {

    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in); // ✅ création d’un objet Scanner
        final String CONSONNE = "bcdfghjklmnpqrstvwxyz"; // ✅ liste des consonnes, en minuscule

        System.out.print("Rentrez une chaine de caractères: "); 
        String chaine = scanner.nextLine(); // ✅ lit la phrase saisie par l’utilisateur
        
        /*******************************************
         * Partie à compléter
         *******************************************/
        
        int nbcons = 0; // ⚠️ Il faut initialiser à 0, sinon erreur de compilation (variable non initialisée)

        // ⚠️ ERREUR : ici tu écris i = i → cela ne change jamais i et la boucle devient infinie.
        // Il faut écrire i++ pour avancer dans la chaîne :
        for (int i = 0; i < chaine.length(); i++) {
            
            // ✅ Boucle interne : compare chaque caractère de la chaîne aux consonnes
            for (int j = 0; j < CONSONNE.length(); j++) {
                
                // ⚠️ Comparaison sensible à la casse : il faut mettre les deux caractères en minuscule
                if (Character.toLowerCase(chaine.charAt(i)) == CONSONNE.charAt(j)) {
                    nbcons++; // ✅ incrémente si c’est une consonne
                    break; // 💡 facultatif, mais utile pour sortir dès qu’on a trouvé une correspondance
                }
            }
        }

        // ✅ Affiche le résultat une seule fois à la fin
        System.out.println("Nombre de consonnes : " + nbcons);
        
        /*******************************************
         * Ne rien modifier après cette ligne.
         *******************************************/
    }
}