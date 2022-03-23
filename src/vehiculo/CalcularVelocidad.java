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
    private double revolucionesAlmacenadas = 0;
    private boolean manteniendo = false;
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
         
         //Actualiza incrementoVelocidad dependiendo del estado del motor;
         switch(estadoMotor){
            case ACELERANDO:
                    incrementoRevoluciones=100;
                 break;
            
            case ACELERANDOAUTO:
                    incrementoRevoluciones=100;
                    manteniendo = false;
                 break;
                
            case FRENANDO:
                    incrementoRevoluciones=-100;
                 break;
            case ENCENDIDO:
                    incrementoRevoluciones=0;
                 break;
            case APAGADO:
                    incrementoRevoluciones=0;
                    revolucionesAlmacenadas = 0;
                 break;
            case MANTENER:
                    if(!manteniendo){
                        revolucionesAlmacenadas=revoluciones;
                        GestorFiltros.setVelocidadAlmacenada(revoluciones);
                        manteniendo=true;
                    }
                    if(revoluciones>revolucionesAlmacenadas)incrementoRevoluciones=0;
                    else incrementoRevoluciones=10;

                    break;
            case REINICIAR:
                    if(revoluciones>(revolucionesAlmacenadas+50)) incrementoRevoluciones=-100;
                    else if(revoluciones<(revolucionesAlmacenadas-50)) incrementoRevoluciones=100;
                    else GestorFiltros.setEstadoMotor(EstadoMotor.MANTENER);
                break;
         }
         
        double rev = revoluciones+incrementoRevoluciones;
         
        if(rev > 5000)
            rev = 5005;
        
        if(rev < 0)
            rev = 0;
        
        return rev;
     }
}
