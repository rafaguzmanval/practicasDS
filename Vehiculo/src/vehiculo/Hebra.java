/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

import java.util.logging.Level;
import java.util.logging.Logger;

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
        {
            try {
                Thread.sleep(200);
            } catch (InterruptedException ex) {
                Logger.getLogger(Hebra.class.getName()).log(Level.SEVERE, null, ex);
            }
            gestor.peticionFiltros();
        }

    }
    
}
