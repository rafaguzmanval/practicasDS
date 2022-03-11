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
public class FactoriaCarretera implements FactoriaCarreraYBicicleta{
    
    
    @Override
    public CarreraCarretera crearCarrera()
    {
        return new CarreraCarretera();
    }
    
    @Override 
    public BicicletaCarretera crearBicicleta(int identificador)
    {
        return new BicicletaCarretera(identificador);
    }
    
}
