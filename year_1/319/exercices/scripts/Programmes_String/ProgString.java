
public class ProgString {

public static void main(String[] args) {

    // 1️⃣ Déclaration et initialisation d'une chaîne de caractères
    String s1 = "abcmbx";  
    // Ici s1 contient : a b c m b x
    // Les positions (indices) des caractères sont :
    //  0   1   2   3   4   5
    //  a   b   c   m   b   x

    // 2️⃣ On récupère la longueur de la chaîne
    int longueur = s1.length();        
    // length() → méthode intégrée qui renvoie le nombre de caractères
    // Ici : longueur = 6

    // 3️⃣ On récupère le premier caractère (à la position 0)
    char c1 = s1.charAt(0);            
    // charAt(n) → renvoie le caractère à la position n (les indices commencent à 0)
    // Ici : c1 = 'a'

    // 4️⃣ On récupère le dernier caractère
    char c2 = s1.charAt(longueur - 1); 
    // Pourquoi -1 ? car le dernier indice = longueur - 1
    // Exemple : pour 6 caractères, les indices vont de 0 à 5
    // Donc charAt(5) = dernier caractère = 'x'

    // 5️⃣ On cherche la première occurrence du caractère 'b'
    int i = s1.indexOf('b');
    // indexOf() → renvoie la position (indice) de la *première* apparition du caractère donné
    // Ici : 'b' apparaît d'abord en position 1 (car le premier 'b' est après 'a')

    // 6️⃣ Affichage des résultats à l'écran
    System.out.println("la longueur de la chaine est de: " + longueur);
    // → "la longueur de la chaine est de: 6"

    System.out.println("En position 0 on a: " + c1);
    // → "En position 0 on a: a"

    System.out.println("A la fin de la chaine on a: " + c2);
    // → "A la fin de la chaine on a: x"

    System.out.println("Le caractère b est en position: " + i);
    // → "Le caractère b est en position: 1"
}


}
