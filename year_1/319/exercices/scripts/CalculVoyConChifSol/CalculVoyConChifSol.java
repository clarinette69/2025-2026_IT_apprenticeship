
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author largere
 */
public class CalculVoyConChifSol {
    
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        final String CONSONNE = "bcdfghjklmnpqrstvwxyz";
        final String VOYELLE = "aeiou";
        final String CHIFFRE = "0123456789";
        
        System.out.print("Rentrez une chaine de caractères: "); 
        String chaine = scanner.nextLine();
        
        int nbcons = 0;
        int nbvoy = 0;
        int nbchiff = 0;
 
        
        for (int  i = 0; i < chaine.length(); i=i+1){
            for (int j = 0; j<CONSONNE.length(); j = j+1){
                if (CONSONNE.charAt(j)==chaine.charAt(i)){
                    nbcons = nbcons +1;
                }
            }
            for (int k = 0; k<VOYELLE.length(); k = k+1){
                if (chaine.charAt(i) == VOYELLE.charAt(k)){
                    nbvoy = nbvoy +1;
                }
            }
            for (int l = 0; l<CHIFFRE.length(); l = l+1){
                if (chaine.charAt(i) == CHIFFRE.charAt(l)){
                    nbchiff = nbchiff +1;
                }
            }    
        }
        System.out.println("le nombre de consonnes est de: "+nbcons);
        System.out.println("le nombre de voyelles est de: "+nbvoy);
        System.out.println("le nombre de chiffres est de: "+nbchiff);
        
    }
    
}
