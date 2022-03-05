/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estacion;

import java.util.Observable;
import java.util.Random;

/**
 *
 * @author emilio
 */
/*******************************************************************************
 * Clase del sujeto observable
 * 
 * Métodos:
 *      getTemperatura
 *      setTemperatura
 *      func1
 *          -> Cambia la temperatura y avisa a los observadores del cambio
 */
public class SujetoObservable extends Observable
{   
    Random random = new Random();
    float temperatura;
    float min = 15;
    float max = 30;
    
    float getTemperatura()
    {
        return temperatura;
    }
    
    float setTemperatura()
    {
        temperatura = min + random.nextFloat() * (max - min);
        return temperatura;
    }
    
    void func1()
    {
        setTemperatura();
        setChanged();
        notifyObservers(getTemperatura());
    }
}
