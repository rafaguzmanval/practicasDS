/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GUI;

import GUI.CuentaRevoluciones;
import GUI.CuentaKilometros;
import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Color;
import java.text.DecimalFormat;
import vehiculo.EstadoMotor;

/**
 *
 * @author rafag
 */
public class Salpicadero extends JPanel{
    
    static Velocimetro velocimetro = null;
    static CuentaKilometros cuentaKilometros = null;
    static CuentaRevoluciones cuentaRevoluciones = null;

    Salpicadero(){
        JLabel s = new JLabel("Salpicadero");
        velocimetro = new Velocimetro();
        cuentaKilometros = new CuentaKilometros();
        cuentaRevoluciones = new CuentaRevoluciones();

        this.setBounds(560,50,500,700);    
        this.setBackground(Color.gray);  
        this.setLayout(null);
        
        s.setBackground(Color.LIGHT_GRAY);
        s.setBounds(220,20,150,30);
        
        this.add(s);
        this.add(velocimetro);
        this.add(cuentaKilometros);
        this.add(cuentaRevoluciones);
    }
    
    public static double ejecutar(double revoluciones, EstadoMotor estadoMotor){
        
        //Calculo velocidad v = 2πr × RPM × (60/1000)km/h
        double v = 2*Math.PI*0.15 * revoluciones * 60/1000;
        
        velocimetro.actualizarValor(v);
        
        //Calculo kilometros recorridos en 0.2 segundos que es el tiempo de
        //espera de la hebra
        
        double k = v * (0.2/3600);
        cuentaKilometros.actualizarValor(k);
        
        //Actualizo revoluciones
        cuentaRevoluciones.actualizarValor(revoluciones);
        
        return revoluciones;
    }
}
