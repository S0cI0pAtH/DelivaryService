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
public class insertOperation {
    Statement stmt;
    public insertOperation(){
        DBConnection myDB = new DBConnection();
        try {
            stmt=myDB.con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(insertOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //add new user 
    public String addNewUser(String uname, String pass, String name, String address, String phn, String type ){

        String sql = "INSERT INTO `users`(`UserName`, `Password`, `Name`, `Phone`, `Address`, `Type`) VALUES ('"+uname+"','"+pass+"','"+name+"','"+address+"','"+phn+"','"+type+"')";
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            return "Wrong information";
            //Logger.getLogger(insertOperation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Successfully Added New User!";
    }
    
    //add new medicine 
    public String addNewMedicine(String DrugsFor, String DrugClass, String BrandName, String Contains, 
            String DosageForm, String Manufacturer, String Price ){
            String sql = "INSERT INTO `medicine_list`( `DrugsFor`, `DrugClass`, `BrandName`, `Contains`, `DosageForm`, `Manufacturer`, `Price`) "+ "VALUES ('"+DrugsFor+"','"+DrugClass+"','"+BrandName+"','"+Contains+"','"+DosageForm+"','"+Manufacturer+"','"+Price+"')";
            try {
                stmt.executeUpdate(sql);
            } catch (SQLException ex) {
                //return "Wrong information";
                Logger.getLogger(insertOperation.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        return "Successfully Added New Medicine!";
    }
    
}
