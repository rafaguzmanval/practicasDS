/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GUI;

import javax.swing.JPanel;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JToggleButton;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import vehiculo.EstadoMotor;
import vehiculo.GestorFiltros;
/**
 *
 * @author javiermg
 */
public class Palanca extends JPanel{
    
    Palanca()
    {
       this.setBounds(40,300,500,400);    
       this.setBackground(Color.gray);  
       this.setLayout(null);
       
       InicializarBotones();
    }
    
    void InicializarBotones(){
        
        //Inicializo el posicionamiento
        JPanel pal1 = new JPanel();
        JPanel pal2 = new JPanel();
        
        pal1.setBackground(Color.black);
        pal1.setBounds(225, 50, 50, 300);
        
        pal2.setBackground(Color.black);
        pal2.setBounds(175, 150, 200, 50);
        
        this.add(pal1);
        this.add(pal2);
    }
    
}
