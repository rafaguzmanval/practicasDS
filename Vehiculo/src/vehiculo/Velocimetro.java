/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Color;

/**
 *
 * @author rafag
 */
public class Velocimetro extends JPanel{
    
    JLabel velocidad;
    
    Velocimetro(){
        JLabel v = new JLabel("Velocímetro (km/h):");
        velocidad = new JLabel("100");

        this.setBounds(10,50,400,30);    
        this.setBackground(Color.LIGHT_GRAY);  
        this.setLayout(null);
        
        v.setBackground(Color.LIGHT_GRAY);
        v.setBounds(5,0,150,30);
        
        velocidad.setForeground(Color.BLUE);
        velocidad.setBounds(250,0,100,30);
        
        this.add(v);
        this.add(velocidad);
    }
    
    public void actualizarValor(double v){
        velocidad.setText(String.valueOf(v));
    }
}
