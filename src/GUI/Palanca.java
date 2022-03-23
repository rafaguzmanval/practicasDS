/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GUI;

import javax.swing.JPanel;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JToggleButton;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import vehiculo.EstadoMotor;
import vehiculo.GestorFiltros;
/**
 *
 * @author javiermg
 */
public class Palanca extends JPanel{
    
    JToggleButton botAcelerar = new JToggleButton("Acelerar");
    JToggleButton botMantener = new JToggleButton();
    
    Palanca(Mandos mando)
    {
       this.setBounds(40,300,500,400);    
       this.setBackground(Color.gray);  
       this.setLayout(null);
       
       InicializarBotones();
       InicializarBotonAcelerar(mando);
       InicializarBotonParar();
       InicializarBotonMantener(mando);
       InicializarBotonReiniciar();
    }
    
    void InicializarBotones(){
        
        //Inicializo el posicionamiento
        JPanel pal1 = new JPanel();
        JPanel pal2 = new JPanel();
        
        pal1.setBackground(Color.black);
        pal1.setBounds(225, 50, 50, 300);
        
        pal2.setBackground(Color.black);
        pal2.setBounds(175, 150, 200, 50);
            
        this.add(pal1);
        this.add(pal2);
        
    }
    
    void InicializarBotonAcelerar(Mandos mando)
    {
        
        botAcelerar.setBounds(195, 10, 100, 30);
        botAcelerar.setText("Acelerar");
        botAcelerar.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(botAcelerar.isSelected() && !botMantener.isSelected() &&!mando.botonFrenar.isSelected() && mando.botonEncender.isSelected())
            {
                botAcelerar.setText("Acelerar");
                GestorFiltros.setEstadoMotor(EstadoMotor.ACELERANDO);
                mando.estadoDelmotor.setText("Acelerando");             
            }
            else
            {
                botAcelerar.setText("Acelerar");
                botAcelerar.setSelected(false);
                
                if(!botAcelerar.isSelected() && mando.estadoDelmotor.getText() == "Acelerando")
                {
                   mando.estadoDelmotor.setText("Encendido");
                   GestorFiltros.setEstadoMotor(EstadoMotor.ENCENDIDO);
                }

            }
        }
               
       }
       );
        
        this.add(botAcelerar);
    }
    
    void InicializarBotonParar()
    {
        JButton botParar = new JButton();
        botParar.setBounds(80, 160, 80, 30);
        
        botParar.setText("Parar");
        
        this.add(botParar);
    }
    
    void InicializarBotonMantener(Mandos mando)
    {
        botMantener.setBounds(380, 160, 110, 30);
        
        botMantener.setText("Mantener");
        
        botMantener.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(botMantener.isSelected() && !botAcelerar.isSelected() && !mando.botonFrenar.isSelected() && mando.botonEncender.isSelected())
            {
                botMantener.setText("Mantener");
                GestorFiltros.setEstadoMotor(EstadoMotor.MANTENER);
                mando.estadoDelmotor.setText("Manteniendo Velocidad");             
            }
            else
            {
                botMantener.setText("Mantener");
                botMantener.setSelected(false);
                
                if(!botMantener.isSelected() && mando.estadoDelmotor.getText() == "Manteniendo Velocidad")
                {
                   mando.estadoDelmotor.setText("Encendido");
                   GestorFiltros.setEstadoMotor(EstadoMotor.ENCENDIDO);
                }

            }
        }
               
       }
       );
        
        this.add(botMantener);
    }
    
    void InicializarBotonReiniciar()
    {
        JButton botReiniciar = new JButton();
        botReiniciar.setBounds(195, 355, 100, 30);
        
        botReiniciar.setText("Reiniciar");
        
        this.add(botReiniciar);
    }
}
