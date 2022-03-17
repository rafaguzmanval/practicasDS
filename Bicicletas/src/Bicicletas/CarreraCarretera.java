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
public class CarreraCarretera extends Carrera{
    
    CarreraCarretera(){
        super();
        this.tipo = "carretera";
    }
    
    @Override
    void retiradaParticipantes(){
        System.out.print("\n");
        for(int i = 0; i < bicicletas.size()*0.1; i++){
            bicicletas.get(i).retirarse();
        }
    }
    
}
