/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

/**
 *
 * @author javiermg
 */
public class RepercutirRozamiento implements Filtro{
    
    private final double rozamiento = 5;
    
    RepercutirRozamiento()
    {
        
    }
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor)
    {
        double roz = revoluciones>0 ? rozamiento : 0;
        return revoluciones - roz;
    }
}
