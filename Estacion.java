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

class hebra1 extends Thread{
    long num=1000;
    int contador=0;
    
    public hebra1(String str)
    {
        super(str);
    }
    
    public void run(SujetoObservable sujeto){
        while(contador != 9){
            sujeto.func1();
            try{
                sleep(num);
            }catch(InterruptedException e){}
            
            contador++;
        }
    }
}

class graficaTemperatura implements Observer
{
    int contador=0;
    
    public ArrayList<Float> temperaturas= new ArrayList<>();  
    
    public void update(Observable obj, Object arg){
        temperaturas.add(contador,((Float)arg).floatValue());
        System.out.println("Observer1 Notified with value: "+ ((Float)arg).floatValue());
        contador = (contador+1)%7;
    }
}

class PantallaTemperatura implements Observer
{
    public void update(Observable obj, Object arg) 
    {
        System.out.println("Observer2 Notified with value: "+ ((Float)arg).floatValue());
    }
}

class SujetoObservable extends Observable
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
