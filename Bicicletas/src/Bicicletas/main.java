/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

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
        
        N = r.nextInt(17) + 3;
        System.out.print(N);
        
    }
    
}
