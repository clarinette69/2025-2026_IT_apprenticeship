/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author largere
 */
    public class GrillBattleShip_solution{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int[][] grille = new int [10][10];
        grille [2][1] = 1;
        grille [2][2] = 1;
        grille [2][3] = 1;
        grille [5][5] = 1;
        grille [6][5] = 1;
        
        System.out.print("=");
        for (int i = 1; i<grille[0].length; i = i+1){
            System.out.print("="+i);
        } 
        System.out.println("=");
        
        for (int j = 1; j<grille.length; j= j+1){
            System.out.print(j+"|");
            for (int k = 1; k<grille[j].length; k= k+1){
                    if (grille [j][k] == 1 ){
                        System.out.print("X");
                    } else {
                        System.out.print(" ");
                    }
                    System.out.print("|");
        }
            System.out.println();
        }
        
        
        
        
    }
    
}
