/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

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

/**
 *
 * @author rafag
 */

public class Mandos extends JPanel{
    
    Salpicadero salpicadero;
    JLabel estadoDelmotor;
    JToggleButton botonEncender;
    JToggleButton botonAcelerar;
    JToggleButton botonFrenar;
    JFrame f;
    JPanel mandos;
    
    public void InicializarVentana()
    {

       salpicadero = new Salpicadero();

       InicializarJPanelMandos();
       InicializarJFrame();
    }
    
    private void InicializarJPanelMandos()
    {
       mandos = new JPanel();
       mandos.setBounds(40,100,500,200);    
       mandos.setBackground(Color.gray);  
       mandos.setLayout(null);
       
       InicializarEtiquetaEstado();
       InicializarBotonEncender();
       InicializarBotonAcelerar();
       InicializarBotonFrenar();
    }
    
    private void InicializarEtiquetaEstado()
    {
       estadoDelmotor = new JLabel("Apagado");
       estadoDelmotor.setBackground(Color.LIGHT_GRAY);
       estadoDelmotor.setBounds(220,50,150,30);
       mandos.add(estadoDelmotor);       
    }
    
    private void InicializarBotonEncender()
    {
       botonEncender = new JToggleButton("Encender");
       botonEncender.setBounds(10,100,150,30);
       botonEncender.setForeground(Color.GREEN);
       botonEncender.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            if(estadoDelmotor.getText() == "Apagado")
            {
               estadoDelmotor.setText("Encendido");
               botonEncender.setText("Apagar");
               botonEncender.setForeground(Color.RED);
               GestorFiltros.setEstadoMotor(EstadoMotor.ACELERANDO);
            }
            else
            {
                 
               estadoDelmotor.setText("Apagado");
               botonEncender.setText("Encender");
               botonEncender.setForeground(Color.GREEN);          
               botonFrenar.setText("Frenar");
               botonAcelerar.setText("Acelerar");
               botonFrenar.setSelected(false);
               botonAcelerar.setSelected(false);
               GestorFiltros.setEstadoMotor(EstadoMotor.APAGADO);
            }
        }
               
       }
       );
       mandos.add(botonEncender);
    }
    
    private void InicializarBotonAcelerar()
    {
       botonAcelerar = new JToggleButton("Acelerar");
       botonAcelerar.setBounds(170,100,150,30);
       botonAcelerar.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            
            if(botonAcelerar.isSelected() && !botonFrenar.isSelected() && botonEncender.isSelected())
            {
                botonAcelerar.setText("Acelerando");
                GestorFiltros.setEstadoMotor(EstadoMotor.ACELERANDO);
                estadoDelmotor.setText("Acelerando");
                
            }
            else
            {
                botonAcelerar.setText("Acelerar");
                botonAcelerar.setSelected(false);
                
                if(!botonAcelerar.isSelected() && estadoDelmotor.getText() == "Acelerando")
                {
                   estadoDelmotor.setText("Encendido");
                   GestorFiltros.setEstadoMotor(EstadoMotor.ENCENDIDO);
                }

            }
        }
               
       }
       );
       mandos.add(botonAcelerar);        
    }
    
    private void InicializarBotonFrenar()
    {
       botonFrenar = new JToggleButton("Frenar");
       botonFrenar.setBounds(330,100,150,30);
       botonFrenar.addActionListener(new ActionListener()
       {
        @Override
        public void actionPerformed(ActionEvent event){
            if(botonFrenar.isSelected() && !botonAcelerar.isSelected() && botonEncender.isSelected())
            {
                botonFrenar.setText("Frenando");
                GestorFiltros.setEstadoMotor(EstadoMotor.FRENANDO);
                estadoDelmotor.setText("Frenando");
            }
            else
            {
                botonFrenar.setText("Frenar");
                botonFrenar.setSelected(false);
                if(!botonFrenar.isSelected() && estadoDelmotor.getText() == "Frenando")
                {
                   estadoDelmotor.setText("Encendido");
                   GestorFiltros.setEstadoMotor(EstadoMotor.ENCENDIDO);
                }
            }
            
        }
               
       }
       );
       mandos.add(botonFrenar);        
    }
    
    private void InicializarJFrame()
    {
       f = new JFrame("Coche");
       f.add(mandos);
       f.add(salpicadero);
       f.setSize(1200,400);    
       f.setLayout(null);    
       f.setVisible(true); 
        //Cerrar aplicación al cerrar ventana
       FuncionCerrarVentana();
    }
    
    private void FuncionCerrarVentana()
    {
         f.addWindowListener( new WindowAdapter() { 
           @Override
            public void windowClosing( WindowEvent evt ) { 
            System.exit( 0 ); 
            } 
        } ); 
    }
    

    
    
    
}
