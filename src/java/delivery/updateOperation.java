package delivery;


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
public class updateOperation {
    Statement stmt;
    public updateOperation(){
        DBConnection myDB = new DBConnection();
        try {
            stmt=myDB.con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(insertOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String updateUserInfo( String uname, String pass, String name, String address, String phn, String type ){
        new deleteOperation().removeAUser(uname);
        String ack = new insertOperation().addNewUser(uname, pass, name, address, phn, type);
        return ack;
    }
    
}
