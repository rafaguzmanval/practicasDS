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
public class hebra1 extends Thread{
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
