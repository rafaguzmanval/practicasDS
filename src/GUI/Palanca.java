/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GUI;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JPanel;
import eu.hansolo.steelseries.gauges.*;
import eu.hansolo.steelseries.tools.BackgroundColor;
import javax.swing.JToggleButton;
import vehiculo.EstadoMotor;
import vehiculo.GestorFiltros;
/**
 *
 * @author javiermg
 */
public class Palanca extends JPanel{
    
    JToggleButton botAcelerar = new JToggleButton("Acelerar");
    JToggleButton botMantener = new JToggleButton();
    JToggleButton botParar = new JToggleButton();
    JToggleButton botReiniciar = new JToggleButton();
    
    JPanel pal1 = new JPanel();
    JPanel pal2 = new JPanel();
    DigitalRadial pal3 = new DigitalRadial();
    
    Palanca(Mandos mando)
    {
       this.setBounds(40,300,500,400);    
       this.setBackground(Color.gray);  
       this.setLayout(null);
       
       InicializarBotones();
       InicializarBotonAcelerar(mando);
       InicializarBotonParar(mando);
       InicializarBotonMantener(mando);
       InicializarBotonReiniciar(mando);
    }
    
    void InicializarBotones(){
        
        //Inicializo el posicionamiento
        
        pal1.setBackground(Color.black);
        pal1.setBounds(225, 50, 50, 300);
        
        pal2.setBackground(Color.black);
        pal2.setBounds(175, 150, 200, 50);
        
        pal3.setTitle("");
        pal3.setUnitString("");
        pal3.setLcdVisible(false);
        pal3.setBackgroundColor(BackgroundColor.RED);
        pal3.setBounds(175, 150, 50, 50);

        this.add(pal3);
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
            
            if(botAcelerar.isSelected() && GestorFiltros.getEstadoMotor()!=EstadoMotor.MANTENER &&!mando.botonFrenar.isSelected() && mando.botonEncender.isSelected() && mando.botonAcelerar.isSelected())
            {
                botAcelerar.setText("Acelerar");
                GestorFiltros.setEstadoMotor(EstadoMotor.ACELERANDOAUTO);
                mando.estadoDelmotor.setText("Acelerando");  
                mando.botonAcelerar.setSelected(false);
                mando.botonAcelerar.setText("Acelerar");
                pal3.setBounds(225, 50, 50, 50);
                botAcelerar.setSelected(false);
            }
        }
               
       }
       );
        
        this.add(botAcelerar);
    }
    
    void InicializarBotonParar(Mandos mando)
    {

        botParar.setBounds(80, 160, 80, 30);
        botParar.setText("Parar");
        this.add(botParar);
        
       botParar.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(botParar.isSelected() && mando.botonEncender.isSelected() && (GestorFiltros.getEstadoMotor()==EstadoMotor.ACELERANDOAUTO || GestorFiltros.getEstadoMotor()==EstadoMotor.MANTENER))
            {
                GestorFiltros.setEstadoMotor(EstadoMotor.ENCENDIDO);
                mando.estadoDelmotor.setText("Encendido"); 
                pal3.setBounds(175, 150, 50, 50);
                botParar.setSelected(false);
            }
        }
        }
        );
       
        //Restablece la palanca al frenar
        mando.botonFrenar.addActionListener(new ActionListener()
        {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(mando.botonFrenar.isSelected() && (GestorFiltros.getEstadoMotor()==EstadoMotor.ACELERANDOAUTO || GestorFiltros.getEstadoMotor()==EstadoMotor.REINICIAR || GestorFiltros.getEstadoMotor()==EstadoMotor.MANTENER))
                pal3.setBounds(175, 150, 50, 50);
        }
        }
        );
        
        //Restablece la palanca al apagar
        mando.botonEncender.addActionListener(new ActionListener()
        {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(!mando.botonEncender.isSelected())
                pal3.setBounds(175, 150, 50, 50);
        }
        }
        );
        
        //Restablece la palanca al acelerar
        mando.botonAcelerar.addActionListener(new ActionListener()
        {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(mando.botonAcelerar.isSelected())
                pal3.setBounds(175, 150, 50, 50);
        }
        }
        );

    }
    
    void InicializarBotonMantener(Mandos mando)
    {
        botMantener.setBounds(380, 160, 110, 30);
        
        botMantener.setText("Mantener");
        
        botMantener.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            if(botMantener.isSelected() && GestorFiltros.getEstadoMotor()==EstadoMotor.ACELERANDOAUTO && !mando.botonFrenar.isSelected() && mando.botonEncender.isSelected())
                pulsarMantener(mando);
        }
               
       }
       );
        
        this.add(botMantener);
    }
    
    public void pulsarMantener(Mandos mando){
        GestorFiltros.setEstadoMotor(EstadoMotor.MANTENER);
        mando.estadoDelmotor.setText("Manteniendo Velocidad"); 
        pal3.setBounds(325, 150, 50, 50);
        botMantener.setSelected(false);
    }
    
    void InicializarBotonReiniciar(Mandos mando)
    {

        botReiniciar.setBounds(195, 355, 100, 30);
        
        botReiniciar.setText("Reiniciar");
        
        this.add(botReiniciar);
        
        botReiniciar.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(botReiniciar.isSelected() && GestorFiltros.getVelocidadAlmacenada()!=0 && (GestorFiltros.getEstadoMotor()==EstadoMotor.ENCENDIDO || GestorFiltros.getEstadoMotor()==EstadoMotor.ACELERANDOAUTO) && mando.botonEncender.isSelected())
            {
                GestorFiltros.setEstadoMotor(EstadoMotor.REINICIAR);
                mando.estadoDelmotor.setText("REINICIANDO"); 
                pal3.setBounds(225, 300, 50, 50);
                botReiniciar.setSelected(false);
            }
        }
               
       }
       );
    }
}
