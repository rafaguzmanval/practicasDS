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
    private double revolucionesAlmacenadasAnt = 0;
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
         
         //Actualiza incrementoVelocidad dependiendo del estado del motor;
         switch(estadoMotor){
            case ACELERANDO:
                    incrementoRevoluciones=100;
                 break;
                 
            case FRENANDO:
                    incrementoRevoluciones=-100;
                    if(revolucionesAlmacenadas!=0){
                        revolucionesAlmacenadasAnt=revolucionesAlmacenadas;
                        revolucionesAlmacenadas=0;
                    }
                 break;
            case ENCENDIDO:
                    incrementoRevoluciones=0;
                    if(revolucionesAlmacenadas!=0){
                        revolucionesAlmacenadasAnt=revolucionesAlmacenadas;
                        revolucionesAlmacenadas = 0;
                    }
                 break;
            case APAGADO:
                    incrementoRevoluciones=0;
                 break;
            case MANTENER:
                    if(revolucionesAlmacenadas==0){
                        revolucionesAlmacenadas=revoluciones;
                        revolucionesAlmacenadasAnt=revolucionesAlmacenadas;
                    }
                    else{
                        if(revoluciones>revolucionesAlmacenadas)incrementoRevoluciones=-100;
                        else incrementoRevoluciones=100;
                    }
                    break;
            case REINICIAR:
                    if(revoluciones>(revolucionesAlmacenadasAnt+100)) incrementoRevoluciones=-100;
                    else if(revoluciones<(revolucionesAlmacenadasAnt-100)) incrementoRevoluciones=100;
                    GestorFiltros.setEstadoMotor(EstadoMotor.MANTENER);
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
