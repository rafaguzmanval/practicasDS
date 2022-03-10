/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

/**
 *
 * @author javiermg
 */
public class Hebra extends Thread{
    
    private GestorFiltros gestor=null;
    
    Hebra(GestorFiltros g){
        gestor = g;
    }
    
    @Override
    public void run(){
        while(true)
            gestor.peticionFiltros();
    }
    
}
