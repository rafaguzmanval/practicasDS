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
import vehiculo.EstadoMotor;
import eu.hansolo.steelseries.gauges.DisplaySingle;

/**
 *
 * @author rafag
 */
public class Salpicadero extends JPanel{
    
    static Velocimetro velocimetro = null;
    static CuentaKilometros cuentaKilometros = null;
    static CuentaRevoluciones cuentaRevoluciones = null;
    static DisplaySingle velocidadAlmacenada = null;
    private static double velocidadAlm = 0;

    Salpicadero(){
        JLabel s = new JLabel("Salpicadero");
        velocimetro = new Velocimetro();
        cuentaKilometros = new CuentaKilometros();
        cuentaRevoluciones = new CuentaRevoluciones();
        JLabel vA = new JLabel("Velocidad Almacenada");
        velocidadAlmacenada = new DisplaySingle();

        this.setBounds(560,50,500,700);    
        this.setBackground(Color.gray);  
        this.setLayout(null);
        
        s.setBackground(Color.LIGHT_GRAY);
        s.setBounds(220,20,150,30);
        
        vA.setBackground(Color.LIGHT_GRAY);
        vA.setBounds(320,50,150,30);
        
        velocidadAlmacenada.setLcdValue(0);
        velocidadAlmacenada.setLcdUnitString("km/h");
        velocidadAlmacenada.setBounds(350,80,150,50);
        
        this.add(s);
        this.add(velocimetro);
        this.add(cuentaKilometros);
        this.add(cuentaRevoluciones);
        this.add(vA);
        this.add(velocidadAlmacenada);
    }
    
    public void establecerVelocidadAlmacenada(double r){
        double v = 2*Math.PI*0.15 * r * 60/1000;
        velocidadAlmacenada.setLcdValue(v);
    }
    
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
        
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
