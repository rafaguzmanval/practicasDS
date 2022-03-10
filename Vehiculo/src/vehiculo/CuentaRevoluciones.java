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
public class CuentaRevoluciones extends JPanel{
    
    JLabel revoluciones;
    
    CuentaRevoluciones(){
        JLabel r = new JLabel("Cuentarrevoluciones (RPM):");
        revoluciones = new JLabel("0");

        this.setBounds(10,130,400,30);    
        this.setBackground(Color.LIGHT_GRAY);  
        this.setLayout(null);
        
        r.setBackground(Color.LIGHT_GRAY);
        r.setBounds(5,0,200,30);
        
        revoluciones.setForeground(Color.BLUE);
        revoluciones.setBounds(250,0,100,30);
        
        this.add(r);
        this.add(revoluciones);
    }
    
    public void actualizarValor(String r){
        revoluciones.setText(r);
    }
}
