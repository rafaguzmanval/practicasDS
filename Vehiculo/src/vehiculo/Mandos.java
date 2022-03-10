/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

import javax.swing.JPanel;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JToggleButton;

/**
 *
 * @author rafag
 */

public class Mandos extends JPanel{
    
    Salpicadero salpicadero;
    JLabel estadoDelmotor;
    JToggleButton botonEncender;
    JToggleButton botonAcelerar;
    JToggleButton botonFrenar;
    
    public void InicializarVentana()
    {
       JFrame f = new JFrame("Coche");
       JPanel mandos = new JPanel();
       
        mandos.setBounds(40,100,300,100);    
        mandos.setBackground(Color.gray);  
        
       estadoDelmotor = new JLabel("Apagado");
       estadoDelmotor.setBackground(Color.LIGHT_GRAY);
       mandos.add(estadoDelmotor);
       
       botonEncender = new JToggleButton("Encender");
       botonEncender.setBounds(200,100,10,10);
       botonEncender.setForeground(Color.GREEN);
       botonEncender.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            if(estadoDelmotor.getText() == "Apagado")
            {
               estadoDelmotor.setText("Encendido");
               botonEncender.setText("Apagar");
               botonEncender.setForeground(Color.RED);
            }
            else
            {
                 
               estadoDelmotor.setText("Apagado");
               botonEncender.setText("Encender");
               botonEncender.setForeground(Color.GREEN);           
            }
        }
               
       }
       );
       mandos.add(botonEncender);
       
       
       botonAcelerar = new JToggleButton("Acelerar");
       botonAcelerar.setBounds(200,200,10,10);
       mandos.add(botonAcelerar);
       
       
       botonFrenar = new JToggleButton("Frenar");
       
       botonFrenar.setBounds(200,200,10,10);
       mandos.add(botonFrenar);
       

       
       f.add(mandos);
                f.setSize(600,400);    
                f.setLayout(null);    
                f.setVisible(true);    
    }
    
    
    private void funcionBotonEncender()
    {

    }
    
    
    
}
