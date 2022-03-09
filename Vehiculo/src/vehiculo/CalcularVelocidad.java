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
    
    private double incrementoRevoluciones = 0;
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
         
         //Actualiza incrementoVelocidad dependiendo del estado del motor;
         switch(estadoMotor){
            case ACELERANDO:
                    incrementoRevoluciones=100;
                 break;
                 
            case FRENANDO:
                    incrementoRevoluciones=-100;
                 break;
            case ENCENDIDO:
                    incrementoRevoluciones=0;
                 break;
            case APAGADO:
                    incrementoRevoluciones=0;
                 break;
         }
          
         double rev = revoluciones+incrementoRevoluciones;
         
         return rev;
     }
}
