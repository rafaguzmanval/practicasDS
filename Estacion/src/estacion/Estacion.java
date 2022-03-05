/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estacion;

import java.util.Observable;
import java.util.Observer;
import java.util.ArrayList;
import java.util.Random;
import java.lang.Thread;


/**
 *
 * @author emilio
 */




class PantallaTemperatura implements Observer
{
    public void update(Observable obj, Object arg) 
    {
        System.out.println("Observer2 Notified with value: "+ ((Float)arg).floatValue());
    }
}




/*******************************************************************************
 * 
 * Clase que contiene el main
 */
public class Estacion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        SujetoObservable sujeto = new SujetoObservable();
        hebra1 uno ;
        
        uno = new hebra1("Prueba");
        
        graficaTemperatura observer1 = new graficaTemperatura();
        PantallaTemperatura observer2 = new PantallaTemperatura();
        sujeto.addObserver(observer1);
        //sujeto.addObserver(observer2);
        
        uno.run(sujeto);
        
        for(int i=0; i< observer1.temperaturas.size() ;i++){
            System.out.println(observer1.temperaturas.get(i));
        }
        
    }
    
}
