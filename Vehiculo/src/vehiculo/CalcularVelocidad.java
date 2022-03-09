/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

/**
 *
 * @author javiermg
 */

public class CalcularVelocidad implements Filtro{
    
    private double incrementoVelocidad = 0;
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
         
         //Actualiza incrementoVelocidad dependiendo del estado del motor;
         switch(estadoMotor){
            case ACELERANDO:
                    incrementoVelocidad=-100;
                 break;
                 
            case FRENANDO:
                    incrementoVelocidad=100;
                 break;
            case ENCENDIDO:
                    incrementoVelocidad=0;
                 break;
            case APAGADO:
                    incrementoVelocidad=0;
                 break;
         }
         
         //Calculo velocidad : v = 2πr × RPM × (60/1000)km/h
          
         double velocidad = 2*Math.PI*0.15 * (revoluciones-incrementoVelocidad) * 60/1000;
         
         return velocidad;
     }
}
