/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

/**
 *
 * @author ravolk
 */
public abstract class Bicicleta extends Thread{
    
    
    protected int identificador;
    protected boolean salir = false;
    
    Bicicleta(int i)
    { this.identificador = i;
    }
    
    
    @Override
    public void run()
    {
        while(!salir)
        {};
       
    }
    
    abstract void finalizar();
    abstract void retirarse();
   
    
}
