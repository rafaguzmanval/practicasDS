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
public class CarreraMontana extends Carrera{

    CarreraMontana(){
        super();
        this.tipo="montaña";
    }
    
    @Override
    void retiradaParticipantes(){
        System.out.print("\n");
        for(int i = 0; i < bicicletas.size()*0.2; i++){
            bicicletas.get(i).retirarse();
        }
    }
   
}
