
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author swapn
 */
public class DBConnection {
    Connection con;
    public DBConnection(){
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection CON=DriverManager.getConnection("jdbc:mysql://localhost:3306/deliveryservice","root","");
            con = CON;
        }catch(Exception e){
            System.out.println("Database Connecting Error!");
        }
    }

}
