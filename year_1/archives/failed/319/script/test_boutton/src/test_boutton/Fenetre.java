/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test_boutton;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/**
 *
 * @author logod
 */

public class Fenetre extends JFrame{
    //Atributs
    private JPanel mainPanel = new JPanel();
    private JLabel label = new JLabel("Yolo!");
    private JPanel centerPanel = new JPanel();
    private JPanel southPanel = new JPanel();
    private JButton b1 = new JButton("Bouton no 1");
    private JButton b2 = new JButton("Bouton 2");
    //Méthodes
    
    public Fenetre (){
        //Titre
        this.setTitle("Boutons réactifs");
        //taille
        this.setSize(500, 300);
        //position
        this.setLocationRelativeTo(null);
        //fermeture
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //Contenu de la fenêtre
            //Grille de positionnment
            mainPanel.setLayout(new BorderLayout());
            //Nord
            label.setFont(new Font("Verdana", Font.BOLD, 16));
            label.setForeground(Color.BLUE);
            label.setHorizontalAlignment(JLabel.CENTER);
            mainPanel.add(label, BorderLayout.NORTH);
            
            //Centre
            mainPanel.add(centerPanel, BorderLayout.CENTER);
            
            //Sud 
            southPanel.add(b1);
                //Ecouter b1
                b1.addActionListener(new Bouton1Listener());
            southPanel.add(b2);
                //Ecouter b2
                b2.addActionListener(new Bouton2Listener());
            mainPanel.add(southPanel, BorderLayout.SOUTH);
  
            this.setContentPane(mainPanel);
        //visible ?
        this.setVisible(true);
    }
    //Ecouteur b1 
    class Bouton1Listener implements ActionListener{
        @Override
        public void actionPerformed (ActionEvent evt){
            label.setText("Vous avez pressez le boutton no 1");
        }
    }
    //Ecouteur b2
        class Bouton2Listener implements ActionListener{
        @Override
        public void actionPerformed (ActionEvent evt){
            label.setText("Vous avez pressez le boutton no 2");
        }
    }
}
