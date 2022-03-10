/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

import java.util.ArrayList;

/**
 *
 * @author javiermg
 */
public class CadenaDeFiltros {
    
    private ArrayList<Filtro> filtros;
    
    CadenaDeFiltros()
    {
        filtros = new ArrayList<Filtro>();
    }
    
    
    
    public void addFiltro(Filtro nuevoFiltro)
    {
        filtros.add(nuevoFiltro);
    }
    
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor)
    {
        double nuevasRevoluciones = revoluciones;
        
        for(int i=0; i < filtros.size(); i++)
        {
            nuevasRevoluciones = filtros.get(0).ejecutar(nuevasRevoluciones,estadoMotor);
        }
        
        return Salpicadero.ejecutar(nuevasRevoluciones, estadoMotor);
    }
    
}
