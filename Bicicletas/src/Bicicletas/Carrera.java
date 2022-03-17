/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ravolk
 */
public abstract class Carrera extends Thread{
    
    protected ArrayList<Bicicleta> bicicletas;
    protected String tipo = "";
    
    @Override 
    public void run()
    {
    
        Random r = new Random();
        
        
        //Tiempo aleatorio en el que se van a retirar
        long seg = 0;
        seg = r.nextInt(60);
        
        //Tiempo restante de carrera tras retirarse
        long segRes = 60 - seg;
        
        //Empieza la carrera
        try {
            for(int i = 0; i<bicicletas.size(); i++){
                bicicletas.get(i).start();
            }
            Thread.sleep(seg*1000);
        } catch (InterruptedException ex) {
                Logger.getLogger(CarreraCarretera.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        this.retiradaParticipantes();
        
        //Resto de la carrera
        try {
            Thread.sleep(segRes*1000);
        } catch (InterruptedException ex) {
                Logger.getLogger(CarreraCarretera.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        this.finalizarCarrera();
        
        for(int i = 0; i<bicicletas.size(); i++){
            try{
               if(bicicletas.get(i).isAlive())
                bicicletas.get(i).join(); 
            } catch (InterruptedException ex) {
                Logger.getLogger(CarreraCarretera.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
    }
    
    abstract void retiradaParticipantes();
    
    
    void añadirBicicletas(ArrayList<Bicicleta> bicis){
        bicicletas = bicis;
    }
    
    void finalizarCarrera()
    {
        System.out.print("\n");
        for(int i = 0; i < bicicletas.size(); i++)
        {
            bicicletas.get(i).finalizar();
        }
    }
}
