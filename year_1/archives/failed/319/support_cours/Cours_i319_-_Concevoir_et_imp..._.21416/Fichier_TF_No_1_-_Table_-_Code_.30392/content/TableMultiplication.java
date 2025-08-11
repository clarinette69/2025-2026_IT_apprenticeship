package tablemultiplication;

// (C) Tony Favre-Bulle - 7 févr. 2022

import java.util.Scanner;


public class TableMultiplication {

    public static void main(String[] args) {
        // Identificateurs
        final int MULTIPLE = 12;
        int inNombre = 0;
        Scanner monScan = new Scanner(System.in);
        
        // Tant que la valeur saisie pas correcte
        while ( (inNombre <1) || (inNombre>12)){
            // Afficher invite
            System.out.println("Veuiller saisir un nombre"
                                               + " [ compris entre 1 et 12 ]");
            
            // Saisir et mémoriser nombre
            try{
                inNombre = monScan.nextInt();
            }
            catch (Exception e){
                System.out.println("!!! Valeur non conforme !!!");
                // Afficher le type d'exception
                //System.out.println("Exception de type : " + e);
                
                // Vider tampon de saisie
                monScan.nextLine();
            }
        }
        
        // Afficher message
        System.out.println("Vous avez choisi d'afficher la table de : " +
                                                                    inNombre);
        
        // Afficher la table
        for (int inCompteur = 1; inCompteur <= MULTIPLE ; inCompteur++){
            System.out.print(inCompteur + " * " + inNombre + " = ");
            System.out.println(inCompteur*inNombre);
        }
    }

}