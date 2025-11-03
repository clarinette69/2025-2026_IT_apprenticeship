package GrillBattleShip;

public class GrillBattleShip {
    public static void main(String[] args) {
    int[][] Grille = new int[10][10];// Déclaration d’un tableau 2D de 10 lignes et 10 colonnes

    Grille[2][1]=1;
    Grille[2][2]=1;
    Grille[2][3]=1;
    Grille[5][5]=1;
    Grille[6][5]=1;

    System.out.println("=");
    for (int i = 1; i < Grille[0].length; i++) {
        System.out.print("=");
    }
    System.out.print("=");
    
    }
}
