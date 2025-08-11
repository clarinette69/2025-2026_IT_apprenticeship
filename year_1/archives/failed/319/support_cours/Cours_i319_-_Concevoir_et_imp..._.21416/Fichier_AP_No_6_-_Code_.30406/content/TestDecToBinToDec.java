package testdectobintodec;

// (C) Tony Favre-Bulle - 23 mars 2022

import java.util.Scanner;


public class TestDecToBinToDec {
    
    // Identificateur statique
    static final int RES = 16; // Résolution binaire maximale
        
    public static void main(String[] args) {
        // Identificateurs
        int inValeur = 498;
        int inValBin[] = {1,0,0,1,1};
        
        int inTabBin [] = new int[RES];
        
        // Test méthode conversion DecToBin
        System.out.print(inValeur + " en base 10 correspond à ");
        AfficheTab( DecToBin(inValeur) );
        System.out.println();
        
        // Test méthode conversion BinToDec
        AfficheTab(inValBin);
        System.out.print(" en base 2 correspond à " + BinToDec(inValBin));
        System.out.println();
        
    }
    
    
    public static int[] DecToBin ( int inValeur ){
        // Identificateurs
        int inTabTemp[] = new int[RES];
        int inTabBin[];
        int inIndex1 = 0;
        int inIndex2 = 0;
        
        // Conversion itérative DEC to BIN
        while ( inValeur != 0 ){
            inTabTemp[inIndex1++] = inValeur % 2;
            inValeur/=2;
        }
        
        // Inverser le contenu du tableau et mémoriser
            // Créer un nouveau tableau de taille adaptée
            inTabBin = new int[inIndex1];
            
            // Positionner l'index1 sur le dernier bit
            inIndex1-=1;
            
            // Inverser les valeurs et mémoriser dans le nouveau tableau
            while ( inIndex1 >= 0 ){
                inTabBin[inIndex2++] = inTabTemp[inIndex1--];
            }
        
        // Retour
        return (inTabBin);
    }
    
    
    public static int BinToDec ( int inTab[] ){
        int inValeur = 0;
        int inIndex = 0;
        
        // Conversion itérative
        while (inIndex < inTab.length){
            inValeur*=2;
            inValeur+=inTab[inIndex++];
        }
        return (inValeur);
    }
    
    
    public static void AfficheTab (int inTab[]){
        for (int inIndex = 0; inIndex < inTab.length; inIndex++){
            System.out.print(inTab[inIndex]);
        }
    }

}