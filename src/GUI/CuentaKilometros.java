/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GUI;

import eu.hansolo.steelseries.gauges.DisplaySingle;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Color;
import java.text.DecimalFormat;
/**
 *
 * @author rafag
 */
public class CuentaKilometros extends JPanel{
    
    DisplaySingle display;
    double kRecorridos = 0;
    
    CuentaKilometros(){
        
        this.setBounds(50,360,200,30);
        this.setBackground(Color.gray);
        
        JLabel titulo = new JLabel();
        display = new DisplaySingle();
        
        titulo.setText("Distancia recorrida: ");
        
        titulo.setBounds(0, 0, 100, 10);

        display.setBounds(100, 0, 50, 30);
        display.setLcdUnitString("km");
        
        
        this.add(titulo);
        this.add(display);
        
    }
    
    public void actualizarValor(double k){
        kRecorridos += k;
        
        display.setLcdValue(kRecorridos);
    }
}
