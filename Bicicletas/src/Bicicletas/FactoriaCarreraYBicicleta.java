/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

import java.util.ArrayList;
/**
 *
 * @author ravolk
 */
public interface FactoriaCarreraYBicicleta{
    
    
    public Carrera crearCarrera();
    public Bicicleta crearBicicleta(int identificador);
    
}
