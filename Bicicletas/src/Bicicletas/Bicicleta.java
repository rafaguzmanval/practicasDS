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
    
    
    private int indentificador;
    
    Bicicleta(int i)
    { this.indentificador = i;
    }
    
    
    @Override
    public void run()
    {
        
    }
    
}
