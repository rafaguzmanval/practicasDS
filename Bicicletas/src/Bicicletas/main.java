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
        
        N = r.nextInt(26) + 5;
        System.out.print("Existen " + N + " bicicletas\n");

        FactoriaCarretera fcarretera = new FactoriaCarretera();
        FactoriaMontana fmontana = new FactoriaMontana();
        
        CarreraCarretera CC = fcarretera.crearCarrera();
        CarreraMontana CM = fmontana.crearCarrera();
        
        ArrayList<Bicicleta> bicisCarretera = new ArrayList<Bicicleta>();
        
        for(int i = 0; i < N ; i++)
        {
            BicicletaCarretera nuevaBici = fcarretera.crearBicicleta(i);
            bicisCarretera.add(nuevaBici);
        }
        
        CC.añadirBicicletas(bicisCarretera);
        
        
        CC.start();
        
    }
    
}
