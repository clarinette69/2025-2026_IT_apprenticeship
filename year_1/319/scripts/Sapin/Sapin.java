package Sapin; // Le code fait partie du paquet (dossier logique) Sapin.
// (Ce nom doit correspondre au dossier si tu compiles en packages.)

public class Sapin { // Déclaration de la classe publique "Sapin".
    public static void main(String[] args) { // Point d'entrée du programme Java.

        // 1) Paramètre de la forme : la hauteur du feuillage = nombre de lignes.
        //    Si hauteur = 9, il y aura 9 lignes de haut pour la partie "triangle".
        int hauteur = 9; // Nombre de lignes de feuillage

        // 2) Boucle extérieure : "une itération = une ligne" du sapin.
        //    i commence à 1 et va jusqu'à 'hauteur' inclus (<=).
        //    Pourquoi à partir de 1 ? Parce qu'on veut que la 1re ligne ait 1 étoile (impair minimal).
        for (int i = 1; i <= hauteur; i++) {

            // 3) Calculer le nombre d'espaces à gauche pour CENTRER la ligne.
            //    Idée : plus on descend (i grand), moins on a besoin d'espaces.
            //    Formule simple : espaces = hauteur - i.
            //    Exemple (hauteur=5) :
            //      i=1 -> 4 espaces ; i=2 -> 3 ; i=3 -> 2 ; i=4 -> 1 ; i=5 -> 0.
            int espaces = hauteur - i; // espaces à imprimer avant les étoiles

            // 4) Calculer le nombre d'étoiles sur la ligne i.
            //    On veut un nombre IMPAIR qui grandit de 2 à chaque ligne : 1,3,5,7...
            //    Formule standard : étoiles = 2*i - 1.
            //    Exemple : i=1 -> 1 ; i=2 -> 3 ; i=3 -> 5 ; ...
            int etoiles = 2 * i - 1;   // nombre d'étoiles (impair) sur cette ligne

            // 5) Première sous-boucle : imprimer les 'espaces' un par un.
            //    Objectif : décaler le bloc d'étoiles vers la droite pour le centrer.
            //    On n'utilise PAS .repeat, donc on fait une boucle simple.
            //    s démarre à 0 (classique en programmation) et imprime "espaces" fois.
            for (int s = 0; s < espaces; s++) {
                System.out.print(" "); // pas de saut de ligne : on colle les espaces sur la même ligne
            }

            // 6) Deuxième sous-boucle : imprimer les 'étoiles' un par un.
            //    Même logique : a va de 0 à etoiles-1, et on imprime "*" à chaque fois.
            for (int a = 0; a < etoiles; a++) {
                System.out.print("*"); // toujours sans saut de ligne
            }

            // 7) Fin de la ligne : on passe à la ligne suivante.
            //    Très important : si tu oublies ce println(), tout s'imprime sur une seule ligne.
            System.out.println();
        }
    }
}
