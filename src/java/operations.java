
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
public class operations {
    Statement stmt;
    public operations(){
        DBConnection myDB = new DBConnection();
        try {
            stmt=myDB.con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(insertOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String isValidUser( String uname, String pass  ){
        String sql = "SELECT UserName, Password FROM `users` WHERE UserName = '"+uname+"'";
        try { 
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
                String UserName = rs.getString(1);
                String Password = rs.getString(2);
                if( UserName.equals(uname) && Password.equals(pass) ){
                    return "ok";
                }
            }
            return "not ok";
            
        } catch (SQLException ex) {
            return "not ok";
            //Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
