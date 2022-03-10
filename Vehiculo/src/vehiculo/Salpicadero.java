/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Color;
import java.text.DecimalFormat;

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

        this.setBounds(560,100,500,200);    
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
        DecimalFormat df = new DecimalFormat("###.##");
        
        velocimetro.actualizarValor(df.format(v));
        
        //Añado kilometros recorridos
        
        double k = v * (0.5/3600);
        cuentaKilometros.actualizarValor(k);
        
        //Actualizo revoluciones
        cuentaRevoluciones.actualizarValor(df.format(revoluciones));
        
        return revoluciones;
    }
}
