/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author ravolk
 */
public abstract class Bicicleta extends Thread{
    
    
    protected int identificador;
    protected boolean compitiendo = false;
    protected String tipo = "";
    
    Bicicleta(int i)
    { this.identificador = i;
    }
    
    
    @Override
    public void run(){
        compitiendo = true;
        while(compitiendo){
            try {
                Thread.sleep(100);
            } catch (InterruptedException ex) {
                    Logger.getLogger(CarreraCarretera.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    void retirarse(){
        this.compitiendo = false;
        System.out.println("La bicleta de "+tipo+" con identificador "+this.identificador+" se retira.");
    }
    

    void finalizar(){
        if(this.compitiendo){
            this.compitiendo = false;
            System.out.println("La bicleta de "+tipo+" con identificador "+this.identificador+" ha llegado al final.");
        }
    }
    
}
