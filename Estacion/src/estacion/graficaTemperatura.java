/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estacion;

import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

/**
 *
 * @author emilio
 */

public class graficaTemperatura implements Observer
{
    int contador=0, cambio=0;
    
    public ArrayList<Float> temperaturas= new ArrayList<>();  
    
    public void update(Observable obj, Object arg){
        if (cambio<7)
            temperaturas.add(contador,((Float)arg).floatValue());
        else
            temperaturas.set(contador, ((Float)arg).floatValue());
        
        
        System.out.println("Observer1 Notified with value: "+ ((Float)arg).floatValue());
        contador = (contador+1)%7;
        cambio++;
    }
}   
