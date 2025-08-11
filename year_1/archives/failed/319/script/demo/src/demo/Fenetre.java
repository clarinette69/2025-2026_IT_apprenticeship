package demo;

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

public class Fenetre extends JFrame{
    //Attributs
    private JPanel mainPanel = new JPanel();
    private JPanel centerPanel = new JPanel ();
    private JPanel southPanel = new JPanel ();
    private JLabel prenom = new JLabel ("Prénom");
    private JLabel nom = new JLabel ("Nom");
    private JTextField jtfPrenom = new JTextField();
    private JTextField jtfNom = new JTextField();
    private JButton ok = new JButton("OK");
    private JButton reset = new JButton("Reset");
    
    private Font police = new Font("Verdana", Font.BOLD, 20);
    private String jTextBox;

    //Méthodes
    public Fenetre (){
        this.setTitle("demo");
        this.setSize(1200, 200);
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        //Contenu
        mainPanel.setLayout(new BorderLayout());
            //Center
            prenom.setPreferredSize(new Dimension(200, 50));
            prenom.setFont(police);
            jtfPrenom.setPreferredSize(new Dimension(950, 50));
            jtfPrenom.setForeground(Color.BLUE);
            
            nom.setPreferredSize(new Dimension(200, 50));
            nom.setFont(police);
            jtfNom.setPreferredSize(new Dimension(950, 50));
            jtfNom.setForeground(Color.BLUE);
            
            centerPanel.add(prenom);
            centerPanel.add(jtfPrenom);
            centerPanel.add(nom);
            centerPanel.add(jtfNom);
            
            mainPanel.add(centerPanel, BorderLayout.CENTER);
            //South
            ok.setPreferredSize(new Dimension(200, 50));
            ok.setFont(police);
            
            reset.setPreferredSize(new Dimension(200, 50));
            reset.setFont(police);
           
            //Ecouteur OK
            ok.addActionListener(new okBoutonListener());
            //Ecouteur RESET
            reset.addActionListener(new resetBoutonListener());
        
        //Panneau sur fenêtre
        southPanel.add(ok);
        southPanel.add(reset);
        mainPanel.add(southPanel, BorderLayout.SOUTH);
        this.setContentPane(mainPanel);
        this.setVisible(true);
    }

    //Ecouteur OK
    class okBoutonListener implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent evt){
            //Mémoriser info champs texte
            jTextBox = jtfPrenom.getText() + " " + jtfNom.getText();
            //Afficher
            if (jTextBox.trim().isEmpty()){
                //Champs vide = erreur
                JOptionPane.showMessageDialog(null, "Pas d'information !!", "ERREUR", JOptionPane.ERROR_MESSAGE);
            }else{    
                //Champs renseignés -> info
                JOptionPane.showMessageDialog(null, jTextBox, "INFORMATION", JOptionPane.INFORMATION_MESSAGE);
            }   
        }
    }
    
    //Ecouteur reset
    class resetBoutonListener implements ActionListener{
        @Override
        public void actionPerformed(ActionEvent evt){
            jtfPrenom.setText("");
            jtfNom.setText("");   
        }
    }
}
