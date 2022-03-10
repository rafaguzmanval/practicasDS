/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vehiculo;

/**
 *
 * @author rafag
 */
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



public class Vista extends JPanel{
    
    private JFrame f;
    private Salpicadero salpicadero;
    private Mandos mandos;
    
    Vista()
    {
        InicializarVentana();
    }
    
    
    private void InicializarVentana()
    {
       salpicadero = new Salpicadero();
       mandos = new Mandos();
       InicializarJFrame();
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
