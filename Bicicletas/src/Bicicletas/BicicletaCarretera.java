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
public class BicicletaCarretera extends Bicicleta{
    
    BicicletaCarretera(int i)
    {
        super(i);
    }
    
    @Override
    void retirarse(){
        System.out.println("La bicleta de carretera con identificador "+this.identificador+" se retira.");
        salir = true;
    }
    
    @Override
    void finalizar(){
        
        if(!salir)
        {
              System.out.println("La bicleta de carretera con identificador "+this.identificador+" ha llegado al final.");
              salir = true;      
        }

    }
}
