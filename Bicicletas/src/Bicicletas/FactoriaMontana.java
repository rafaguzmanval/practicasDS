/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bicicletas;

/**
 *
 * @author ravolk
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    
    
    @Override
    public CarreraMontana crearCarrera()
    {
        return new CarreraMontana();
    }
    
    @Override 
    public BicicletaMontana crearBicicleta()
    {
        return new BicicletaMontana(int id);
    }
    
}
