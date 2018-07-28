
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
public class testcon {
    
    public static void main(String arg[] ){
        /*
        DBConnection myDB = new DBConnection();
        try {
            Statement stmt=myDB.con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from users"); 
            while(rs.next())  
            System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
            myDB.con.close();  
        } catch (SQLException ex) {
            Logger.getLogger(testcon.class.getName()).log(Level.SEVERE, null, ex);
        }
        */
        insertOperation op = new insertOperation();
        String ack = op.addNewUser("shibli", "1234", "cg4", "kon ek jaygate", "016969", "user");
        System.out.println(ack);
        
            
            /*
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/deliveryservice","root","");  
            //here sonoo is database name, root is username and password  
            Statement stmt=con.createStatement();  
            ResultSet rs=stmt.executeQuery("select * from users");  
            while(rs.next())  
            System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
            con.close();  
            }catch(Exception e){ System.out.println(e);}  

*/
             
    }
    
}
