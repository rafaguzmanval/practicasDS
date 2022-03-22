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

    static void setEstadoMotor() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    private CadenaDeFiltros filtros;
    private double revoluciones = 0;
    private static EstadoMotor estadoM = EstadoMotor.APAGADO; 
    
    GestorFiltros(){
        
        filtros = new CadenaDeFiltros();
        
        Filtro filtroCV = new CalcularVelocidad();
        Filtro filtroRR = new RepercutirRozamiento();
        
        filtros.addFiltro(filtroCV);
        filtros.addFiltro(filtroRR);
    }
    
    public void peticionFiltros(){
        revoluciones = filtros.ejecutar(revoluciones, estadoM);
    }
    
    public static void setEstadoMotor(EstadoMotor estado)
    {
        estadoM = estado;
    }
}
