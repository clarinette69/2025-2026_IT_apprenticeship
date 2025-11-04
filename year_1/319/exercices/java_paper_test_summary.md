# Résumé papier Java (5 pages recto-verso)

## Page 1 – Démarrer un programme Java

- **Créer et exécuter un premier projet sans NetBeans**  
  Copie le programme minimal dans ton éditeur, compile avec `javac`, puis lance avec `java`.  
  ```java
  public class Bonjour304711 {
      public static void main(String[] args) {
          System.out.println("Bonjour 304711");
      }
  }
  ```
  【F:year_1/319/exercices/scripts/Bonjour304711/Bonjour304711.java†L1-L9】

- **Hello World et structure de base d’une classe**  
  Observe la forme obligatoire : nom de classe, méthode `main`, instructions entre accolades.  
  ```java
  public class HelloWorld {
      public static void main(String[] args) {
          System.out.println("Hello, World!");
      }
  }
  ```
  【F:year_1/319/exercices/scripts/HelloWorld/HelloWorld.java†L2-L6】

- **Conseil pratique**  
  Quand tu modifies le texte affiché, pense à recompiler avant de relancer le programme.

## Page 2 – Entrées clavier, expressions et permutations

- **Lire des valeurs avec `Scanner`**  
  Modèle pour récupérer deux entiers et fermer proprement le flux clavier.  
  ```java
  import java.util.Scanner;

  public class AddiMutli {
      public static void main(String[] args) {
          Scanner clavier = new Scanner(System.in);

          System.out.println("Entrez la valeur de a : ");
          int a = clavier.nextInt();
          System.out.println("Entrez la valeur de b : ");
          int b = clavier.nextInt();

          int somme = a + b;
          int produit = a * b;
          System.out.println("La somme de a plus b vaut: " + somme);
          System.out.println("Le produit de a par b vaut: " + produit);

          clavier.close();
      }
  }
  ```
  【F:year_1/319/exercices/scripts/AddiMutli/AddiMutli.java†L1-L34】

- **Calculer une année de naissance**  
  Réutilise la saisie pour relier plusieurs données.  
  ```java
  Scanner clavier = new Scanner(System.in);
  System.out.print("Quel âge avez-vous ? ");
  int age = clavier.nextInt();
  System.out.print("En quel année êtes-vous ? ");
  int year = clavier.nextInt();
  int naissance = year - age;
  System.out.println("Vous êtes né en " + naissance);
  clavier.close();
  ```
  【F:year_1/319/exercices/scripts/Age/Age.java†L6-L25】

- **Permutation de deux valeurs**  
  Trois variables suffisent pour échanger sans perdre d’information.  
  ```java
  System.out.print("Entrez un chiffre x: ");
  int xOriginal = clavier.nextInt();
  System.out.print("Entrez un chiffre y: ");
  int yOriginal = clavier.nextInt();

  int z = xOriginal;
  int x = yOriginal;
  int y = z;

  System.out.println("Avant permutation: x = " + xOriginal + ", y = " + yOriginal);
  System.out.println("Après permutation: x = " + x + ", y = " + y);
  clavier.close();
  ```
  【F:year_1/319/exercices/scripts/perm/src/Permut.java†L9-L30】

## Page 3 – Conditions, booléens et boucles

- **Structure `if / else` simple**  
  ```java
  Scanner clavier = new Scanner(System.in);
  System.out.print("Entrez la valeur de a : ");
  int a = clavier.nextInt();

  if (a < 6) {
      System.out.print("la valeur de a est inférieur à 6.");
  } else {
      System.out.print("la valeur de a est supérieur à 6.");
  }

  clavier.close();
  ```
  【F:year_1/319/exercices/scripts/MaStructChoix/MaStructChoix.java†L10-L33】

- **Tester un intervalle fermé**  
  Utilise l’opérateur logique `&&` (« et »).  
  ```java
  Scanner clavier = new Scanner(System.in);
  System.out.print("Entrez la valeur de n entre 1 et 10: ");
  int n = clavier.nextInt();

  if ((n >= 1) && (n <= 10)) {
      System.out.print("correct");
  } else {
      System.out.print("incorrect");
  }

  clavier.close();
  ```
  【F:year_1/319/exercices/scripts/MaStructChoix3/MaStructChoix3.java†L9-L23】

- **Boucle `for` avec compteur**
  Ajuste la borne haute et le pas selon tes besoins.
  ```java
  int j = 2;
  for (int i = 1; i <= 10; ++i) {
      System.out.println(j + " multiplie par " + i + " vaut " + j * i);
  }
  ```
  【F:year_1/319/exercices/scripts/MaBoucleFor/MaBoucleFor.java†L7-L9】

- **Boucle `while` (penser à mettre à jour la variable)**
  ```java
  int i = clavier.nextInt();
  while (i < 10) {
      System.out.println("bonjour " + i);
      i = i + 1; // ajout indispensable pour éviter la boucle infinie
  }
  ```
  【F:year_1/319/exercices/scripts/MaBoucleWhile/MaBoucleWhile.java†L10-L15】

- **Boucle `do … while` (exécutée au moins une fois)**  
  ```java
  int i = clavier.nextInt();
  do {
      System.out.println("bonjour " + i);
      i = i + 1;
  } while (i < 10);
  ```
  【F:year_1/319/exercices/scripts/MaBoucleDoWhile/MaBoucleDoWhile.java†L10-L16】

- **Table complète avec boucles imbriquées**  
  ```java
  System.out.println("Tables de multiplication");
  for (int i = 2; i <= 10; i = i + 1) {
      System.out.println("\n Table de " + i + " :");
      for (int j = 1; j <= 10; j = j + 1) {
          System.out.println(" " + j + " * " + i + " = " + i * j);
      }
  }
  ```
  【F:year_1/319/exercices/scripts/TablesCorrected/TablesCorrected.java†L4-L12】

- **Analyse complète d’un nombre (signe et parité)**  
  ```java
  System.out.print("Entrez un nombre entier : ");
  int n = clavier.nextInt();

  if (n == 0) {
      System.out.println("Le nombre est 0 et est pair.");
  } else {
      if (n > 0) {
          System.out.println("Nombre positif.");
      } else {
          System.out.println("Nombre négatif.");
      }

      if (n % 2 == 0) {
          System.out.println("Nombre pair.");
      } else {
          System.out.println("Nombre impair.");
      }
  }
  ```
  【F:year_1/319/exercices/scripts/Nombre/AnalyseNombre.java†L10-L38】

## Page 4 – Tableaux (1D, 2D) et grilles

- **Tableau à une dimension**  
  ```java
  int[] scores = new int[4];
  scores[0] = 1000;
  scores[1] = 1500;
  scores[2] = 2490;
  scores[3] = 6450;

  System.out.println("Les scores sont:");
  for (int i = 0; i < scores.length; i++) {
      System.out.println("joueur " + (i + 1) + ": " + scores[i]);
  }
  ```
  【F:year_1/319/exercices/scripts/StaticArray/StaticArray.java†L9-L36】

- **Tableau à deux dimensions saisi au clavier**  
  ```java
  int[][] y = new int[3][2];
  for (int i = 0; i < y.length; i++) {
      for (int j = 0; j < y[i].length; j++) {
          System.out.print("Entrez y[" + i + "][" + j + "] : ");
          y[i][j] = sc.nextInt();
      }
  }

  for (int i = 0; i < y.length; i++) {
      for (int j = 0; j < y[i].length; j++) {
          System.out.print(y[i][j] + " ");
      }
      System.out.println();
  }
  ```
  【F:year_1/319/exercices/scripts/StaticArray1/StaticArray1.java†L6-L29】

- **Fusion (entrelacement) de deux tableaux**
  ```java
  int[] tab1 = {1, 7, 6};
  int[] tab2 = new int[tab1.length];
  // ... saisie de tab2 ...
  int taille1 = tab1.length + tab2.length;
  int[] tab3 = new int[taille1];
  int position = 0;
  int tailleMax = Math.max(tab1.length, tab2.length);
  for (int i = 0; i < tailleMax; i++) {
      if (i < tab1.length) {
          tab3[position] = tab1[i];
          position++;
      }
      if (i < tab2.length) {
          tab3[position] = tab2[i];
          position++;
      }
  }
  System.out.println("Tableau entrelacé :");
  for (int valeur : tab3) {
      System.out.print(valeur + " ");
  }
  System.out.println();
  ```
  【F:year_1/319/exercices/scripts/Entrelacement/Entrelacement.java†L7-L60】

- **Grille type bataille navale**  
  ```java
  int[][] grille = new int[10][10];
  grille[2][1] = 1;
  grille[2][2] = 1;
  grille[2][3] = 1;
  grille[5][5] = 1;
  grille[6][5] = 1;

  System.out.print("=");
  for (int i = 1; i < grille[0].length; i = i + 1) {
      System.out.print("=" + i);
  }
  System.out.println("=");

  for (int j = 1; j < grille.length; j = j + 1) {
      System.out.print(j + "|");
      for (int k = 1; k < grille[j].length; k = k + 1) {
          if (grille[j][k] == 1) {
              System.out.print("X");
          } else {
              System.out.print(" ");
          }
          System.out.print("|");
      }
      System.out.println();
  }
  ```
  【F:year_1/319/exercices/scripts/GrillBattleShip_solution/GrillBattleShip_solution.java†L18-L42】

## Page 5 – Chaînes, motifs graphiques et applications complètes

- **Méthodes utiles sur les chaînes (`String`)**  
  ```java
  String s1 = "abcmbx";
  int longueur = s1.length();
  char c1 = s1.charAt(0);
  char c2 = s1.charAt(longueur - 1);
  int i = s1.indexOf('b');

  System.out.println("la longueur de la chaine est de: " + longueur);
  System.out.println("En position 0 on a: " + c1);
  System.out.println("A la fin de la chaine on a: " + c2);
  System.out.println("Le caractère b est en position: " + i);
  ```
  【F:year_1/319/exercices/scripts/Programmes_String/ProgString.java†L8-L38】

- **Lire une chaîne et afficher premier / dernier caractère**  
  ```java
  String s = clavier.nextLine();
  char c1 = s.charAt(0);
  char c2 = s.charAt(s.length() - 1);
  System.out.println("En position 0 on a: " + c1);
  System.out.println("A la fin de la chaîne on a: " + c2);
  ```
  【F:year_1/319/exercices/scripts/Programmes_String/ProgString1.java†L10-L16】

- **Compter consonnes, voyelles et chiffres**
  ```java
  final String CONSONNE = "bcdfghjklmnpqrstvwxyz";
  final String VOYELLE = "aeiou";
  final String CHIFFRE = "0123456789";
  int nbcons = 0;
  int nbvoy = 0;
  int nbchiff = 0;
  for (int i = 0; i < chaine.length(); i++) {
      for (int j = 0; j < CONSONNE.length(); j++) {
          if (CONSONNE.charAt(j) == chaine.charAt(i)) {
              nbcons++;
          }
      }
      for (int k = 0; k < VOYELLE.length(); k++) {
          if (chaine.charAt(i) == VOYELLE.charAt(k)) {
              nbvoy++;
          }
      }
      for (int l = 0; l < CHIFFRE.length(); l++) {
          if (chaine.charAt(i) == CHIFFRE.charAt(l)) {
              nbchiff++;
          }
      }
  }
  System.out.println("le nombre de consonnes est de: " + nbcons);
  System.out.println("le nombre de voyelles est de: " + nbvoy);
  System.out.println("le nombre de chiffres est de: " + nbchiff);
  ```
  【F:year_1/319/exercices/scripts/CalculVoyConChifSol/CalculVoyConChifSol.java†L19-L47】

- **Motifs numériques et triangles**  
  ```java
  for (int j = 1; j <= 9; j = j + 1) {
      for (int i = 1; i <= j; i = i + 1) {
          System.out.print(i);
      }
      System.out.println();
  }

  for (int j = 1; j <= 9; j = j + 1) {
      for (int i = 1; i <= (9 - j); i = i + 1) {
          System.out.print(" ");
      }
      for (int i = 1; i <= j; i = i + 1) {
          System.out.print(i);
      }
      System.out.println();
  }
  ```
  【F:year_1/319/exercices/scripts/FiguresCorrected/FiguresCorrected.java†L23-L40】

  ```java
  for (int i = 1; i < 10; ++i) {
      for (int j = 1; j <= i; ++j) {
          System.out.print(j);
      }
      System.out.println();
  }
  ```
  【F:year_1/319/exercices/scripts/Figure2Triangle/Figure2Triangle.java†L7-L12】

- **Sapin d’étoiles (programme complet)**
  ```java
  import java.util.Scanner;

  public class Sapin {
      private static final Scanner clavier = new Scanner(System.in);

      public static void main(String[] args) {
          System.out.print("Entrez le nombre de lignes du sapin : ");
          int n = clavier.nextInt();
          for (int i = 0; i < n; i++) {
              for (int j = 0; j <= n - i - 1; j++) {
                  System.out.print(" ");
              }
              for (int k = 0; k <= 2 * i; k++) {
                  System.out.print("*");
              }
              System.out.println();
          }
      }
  }
  ```
  【F:year_1/319/exercices/scripts/sapin_corrected/Sapin.java†L1-L23】

- **Gestion de budget (Roses Blanches)**  
  ```java
  import java.util.Scanner;

  public class RosesBlanches {
      private static Scanner scanner = new Scanner(System.in);
      public static void main(String[] args) {
          System.out.print("Combien avez-vous reçu d'argent (Frs):) ");
          int budget = scanner.nextInt();
          int budgetLivres = budget * 3 / 4;
          int resteBudget = budget - budgetLivres;
          int autre = resteBudget / 3;
          int nbcafes = autre / 2;
          int nbFlash = autre / 4;
          int nbBillets = autre / 3;
          int reste = resteBudget - (nbcafes * 2 + nbFlash * 4 + nbBillets * 3);
          System.out.println("Livres et Fournitures: " + budgetLivres + " Frs.");
          System.out.println("Vous pouvez ensuite acheter:");
          System.out.println(" " + nbcafes + " cafés");
          System.out.println(" " + nbFlash + " numéros du Flash");
          System.out.println(" " + nbBillets + " billets de métro");
          System.out.println("et il vous restera " + reste + " Frs pour les roses blanches.");
      }
  }
  ```
  【F:year_1/319/exercices/scripts/RosesBlanches_corrected/RosesBlanches.java†L12-L41】

- **Simulation de prêt bancaire**
  ```java
  import java.util.Scanner;

  public class Pret {
      private static Scanner clavier = new Scanner(System.in);

      public static void main(String[] args) {
          double S = 0.0;
          do {
              System.out.print("Somme prêtée (S > 0) : ");
              S = clavier.nextDouble();
          } while (S <= 0.0);

          double R = 0.0;
          do {
              System.out.print("Montant fixe remboursé chaque mois (R > 0) : ");
              R = clavier.nextDouble();
          } while (R <= 0.0);

          double T = 0.0;
          do {
              System.out.print("Taux d'intérêt en % (0 < T < 100) : ");
              T = clavier.nextDouble();
          } while ((T <= 0.0) || (T >= 100.0));

          T = T / 100;
          double cumul = 0.0;
          double SR = S;
          int n = 0;

          while (SR > 0.0) {
              double interet = SR * T;
              cumul = cumul + interet;
              SR = SR + interet - R;
              n = n + 1;
              if (SR < 0.0) {
                  SR = 0.0;
              }
              System.out.println(n + ": Somme Restant = " + SR + " Cumul = " + cumul);
              if (R <= interet && SR > 0.0) {
                  System.out.println("Le remboursement mensuel est insuffisant pour couvrir les intérêts.");
                  break;
              }
          }
          System.out.println("Somme des intêrets encaissés : " + cumul + " (Sur " + n + " mois)");
      }
  }
  ```
  【F:year_1/319/exercices/scripts/Pret/Pret.java†L4-L68】

- **Conseils d’examen**  
  - Repère les erreurs classiques : opérateur logique mal choisi, variable de boucle non mise à jour, indice qui dépasse la taille d’un tableau.【F:year_1/319/exercices/scripts/MaStructChoix3/MaStructChoix3.java†L13-L20】【F:year_1/319/exercices/scripts/MaBoucleWhile/MaBoucleWhile.java†L13-L21】【F:year_1/319/exercices/scripts/StaticArray/StaticArray.java†L24-L36】
  - Quand tu lis ou affiches des données, décris toujours l’ordre entrée → traitement → sortie pour expliquer un programme sur papier.【F:year_1/319/exercices/scripts/AddiMutli/AddiMutli.java†L19-L34】【F:year_1/319/exercices/scripts/Programmes_String/ProgString.java†L8-L38】
