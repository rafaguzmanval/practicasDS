/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

/**
 *
 * @author rafag
 */
public class GestorFiltros {
    
    private CadenaDeFiltros filtros;
    private double revoluciones = 0;
    private EstadoMotor estadoM = EstadoMotor.APAGADO; 
    
    GestorFiltros(){
        Filtro filtroCV = new CalcularVelocidad();
        Filtro filtroRR = new RepercutirRozamiento();
        
        filtros.addFiltro(filtroCV);
        filtros.addFiltro(filtroRR);
    }
    
    public void peticionFiltros(){
        revoluciones = filtros.ejecutar(revoluciones, estadoM);
    }
}
