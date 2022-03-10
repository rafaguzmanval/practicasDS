/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vehiculo;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 *
 * @author rafag
 */
public class Cliente extends JPanel{

    /**
     * @param args the command line arguments
     * 
     * 
     */

    
    
    public static void main(String[] args) {
        
        GestorFiltros gestor = new GestorFiltros();
        gestor.peticionFiltros();
        
       JFrame f = new JFrame("Mandos");
       JPanel mandos = new JPanel();
       
        mandos.setBounds(40,80,200,200);    
        mandos.setBackground(Color.gray);  
       
       JButton botonEncender = new JButton("Encender");
       
        botonEncender.setBounds(50,100,80,30);
        botonEncender.setForeground(Color.GREEN);
       // botonEncender.setBackground(Color.red);
       
       mandos.add(botonEncender);
       
       f.add(mandos);
                f.setSize(800,400);    
                f.setLayout(null);    
                f.setVisible(true);    
        
        
    }
    
}
