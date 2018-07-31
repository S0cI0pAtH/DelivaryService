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
public class deleteOperation {
    Statement stmt;
    public deleteOperation(){
        DBConnection myDB = new DBConnection();
        try {
            stmt=myDB.con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(insertOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    String removeAUser( String uname ){
        String sql = "DELETE FROM `users` WHERE UserName = '"+uname+"'";
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            return "Wrong Information";
            //Logger.getLogger(deleteOperation.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Successfully Removed " + uname;
    }
    
    String removeAMedicine( int id ){
        String sql = "DELETE FROM `medicine_list` WHERE id = '"+id+"'";
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            return "Wrong Information";
            //Logger.getLogger(deleteOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Successfully Removed " + id;
    }
    
}
