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
 * @author rafag
 */

public class Mandos extends JPanel{
    
    JLabel estadoDelmotor;
    JToggleButton botonEncender;
    JToggleButton botonAcelerar;
    JToggleButton botonFrenar;
    

    
    Mandos()
    {
       this.setBounds(40,100,500,200);    
       this.setBackground(Color.gray);  
       this.setLayout(null);
       
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
       this.add(estadoDelmotor);       
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
               GestorFiltros.setEstadoMotor(EstadoMotor.ENCENDIDO);
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
       this.add(botonEncender);
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
                botonAcelerar.setText("Soltar acelerador");
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
       this.add(botonAcelerar);        
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
                botonFrenar.setText("Soltar freno");
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
       this.add(botonFrenar);        
    }

}
