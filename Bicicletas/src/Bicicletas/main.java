/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author ravolk
 */
public class main {
    
    private static int N;

    
    public static void main(String[] args)
    {
        Random r = new Random();
        
        N = r.nextInt(15) + 5;
        System.out.print(N);

        FactoriaCarretera fcarretera = new FactoriaCarretera();
        FactoriaMontana fmontana = new FactoriaMontana();
        
        ArrayList<Bicicleta> bicisCarretera = new ArrayList<Bicicleta>();
        ArrayList<Bicicleta> bicisMontana = new ArrayList<Bicicleta>();
        
        CarreraCarretera CC = fcarretera.crearCarrera();
        CarreraMontana CM = fmontana.crearCarrera();
        
        for(int i = 0; i < N ; i++)
        {
            bicisCarretera.add(fcarretera.crearBicicleta(i));
        }
        
        
        
        for(int i=N; i<2*N ; i++){
            bicisMontana.add(fmontana.crearBicicleta(i));
        }
        
        
        CC.run();
        
    }
    
}
