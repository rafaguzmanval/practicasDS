/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Color;
import java.text.DecimalFormat;
/**
 *
 * @author rafag
 */
public class CuentaKilometros extends JPanel{
    
    JLabel kilometros;
    double kRecorridos = 0;
    
    CuentaKilometros(){
        JLabel c = new JLabel("Cuentakilometros:");
        kilometros = new JLabel("0");

        this.setBounds(10,90,400,30);    
        this.setBackground(Color.LIGHT_GRAY);  
        this.setLayout(null);
        
        c.setBackground(Color.LIGHT_GRAY);
        c.setBounds(5,0,200,30);
        
        kilometros.setForeground(Color.BLUE);
        kilometros.setBounds(250,0,100,30);
        
        this.add(c);
        this.add(kilometros);
    }
    
    public void actualizarValor(double k){
        kRecorridos += k;
        DecimalFormat df = new DecimalFormat("###.##");
        
        kilometros.setText(df.format(kRecorridos));
    }
}
