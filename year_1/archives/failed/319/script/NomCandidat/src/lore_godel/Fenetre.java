package lore_godel;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Fenetre extends JFrame {
    private JTextField[] ipFields;
    private JLabel classLabel;
    private JButton validateButton, resetButton;

    public Fenetre() {
        // Configuration de la fenêtre principale
        setTitle("Classes IP (RFC-950) - CDC 2024");
        setSize(600, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // NORTH: Saisie et affichage d'adresse IP
        JPanel northPanel = new JPanel();
        northPanel.setLayout(new FlowLayout());
        ipFields = new JTextField[4];
        for (int i = 0; i < 4; i++) {
            ipFields[i] = new JTextField(3);
            ipFields[i].setPreferredSize(new Dimension(100, 50)); // Taille des champs de saisie
            ipFields[i].setFont(new Font("Verdana", Font.BOLD, 20)); // Police des champs de saisie
            ipFields[i].setHorizontalAlignment(JTextField.CENTER); // Centrage du texte
            northPanel.add(ipFields[i]);
            if (i < 3) {
                northPanel.add(new JLabel("."));
            }
        }
        add(northPanel, BorderLayout.NORTH);

        // CENTER: Affichage de la classe
        JPanel centerPanel = new JPanel();
        classLabel = new JLabel("Veuillez saisir une adresse IP");
        classLabel.setFont(new Font("Verdana", Font.BOLD, 20)); // Police et taille du texte de la zone centrale
        classLabel.setForeground(Color.RED); // Couleur du texte de la zone centrale
        centerPanel.add(classLabel);
        add(centerPanel, BorderLayout.CENTER);

        // SOUTH: Boutons d'action
        JPanel southPanel = new JPanel();
        validateButton = new JButton("VALIDER");
        validateButton.setFont(new Font("Verdana", Font.BOLD, 20)); // Police et taille du texte du bouton
        validateButton.setForeground(Color.GREEN); // Couleur du texte du bouton
        resetButton = new JButton("RESET");
        resetButton.setFont(new Font("Verdana", Font.BOLD, 20)); // Police et taille du texte du bouton
        resetButton.setForeground(Color.RED); // Couleur du texte du bouton
        southPanel.add(validateButton);
        southPanel.add(resetButton);
        add(southPanel, BorderLayout.SOUTH);

        // Ajout des actions aux boutons
        validateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                validateIPAddress();
            }
        });
        
        resetButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                resetFields();
            }
        });
    }

    private void validateIPAddress() {
        try {
            String ipAddress = "";
            for (JTextField field : ipFields) {
                ipAddress += field.getText() + ".";
            }
            ipAddress = ipAddress.substring(0, ipAddress.length() - 1); // Remove last dot
            String[] parts = ipAddress.split("\\.");
            if (parts.length != 4) {
                showErrorMessage("Veuillez saisir une adresse IP valide");
                return;
            }
            int[] ipParts = new int[4];
            for (int i = 0; i < 4; i++) {
                ipParts[i] = Integer.parseInt(parts[i]);
                if (ipParts[i] < 0 || ipParts[i] > 255) {
                    showErrorMessage("Veuillez saisir une adresse IP valide");
                    return;
                }
            }
            String ipClass = getClassOfIP(ipParts);
            classLabel.setText(ipClass);
        } catch (NumberFormatException e) {
            showErrorMessage("Veuillez saisir une adresse IP valide");
        }
    }

    private void resetFields() {
        for (JTextField field : ipFields) {
            field.setText("");
        }
        classLabel.setText("Veuillez saisir une adresse IP");
    }

    private void showErrorMessage(String message) {
        JOptionPane.showMessageDialog(this, message, "Erreur", JOptionPane.ERROR_MESSAGE);
    }

    private String getClassOfIP(int[] ipParts) {
        if (ipParts[0] >= 0 && ipParts[0] <= 127) {
            return "Classe A";
        } else if (ipParts[0] >= 128 && ipParts[0] <= 191) {
            return "Classe B";
        } else if (ipParts[0] >= 192 && ipParts[0] <= 223) {
            return "Classe C";
        } else if (ipParts[0] >= 224 && ipParts[0] <= 239) {
            return "Classe D";
        } else if (ipParts[0] >= 240 && ipParts[0] <= 255) {
            return "Classe E";
        } else {
            return "Hors plage valide RFC-950";
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Fenetre().setVisible(true);
            }
        });
    }
}
