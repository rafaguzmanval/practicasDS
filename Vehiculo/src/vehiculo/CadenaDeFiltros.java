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
    
    
    public void addFiltro(Filtro nuevoFiltro)
    {
        filtros.add(nuevoFiltro);
    }
    
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor)
    {
        for(int i=0; i < filtros.size(); i++)
        {
            filtros.get(0).ejecutar(revoluciones,estadoMotor);
        }
        
        Objetivo.ejecutar(revoluciones, estadoMotor);
    }
    
}
