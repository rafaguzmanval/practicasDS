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
    
    
    private int identificador;
    
    Bicicleta(int i)
    { this.identificador = i;
    }
    
    
    @Override
    public void run()
    {
        
    }
    
    void retirarse(){
        System.out.println("La bicleta con identificador "+this.identificador+" se retira.");
    }
    
}
