package delivery;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
    
    public boolean isValidUser( String uname, String pass  ){
        String sql = "SELECT UserName, Password FROM `users` WHERE UserName = '"+uname+"'";
        try { 
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
                String UserName = rs.getString(1);
                String Password = rs.getString(2);
                if( UserName.equals(uname) && Password.equals(pass) ){
                    return true;
                }
            }
            return false;
            
        } catch (SQLException ex) {
            return false;
            //Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int total_medicine(){
        String sql = "SELECT count(*) FROM `medicine_list`";
        try { 
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
               int tot = Integer.parseInt(rs.getString(1));
                return tot; 
            }  
        } catch (SQLException ex) {
            return -1;
            //Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public ArrayList<medicine> medicineList(){
        ArrayList<medicine> tot = new ArrayList<>();
        String sql = "SELECT * FROM `medicine_list`";
        try { 
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
               int id = Integer.parseInt(rs.getString(1));
               String DrugsFor = rs.getString(2);
               String DrugClass = rs.getString(3);
               String BrandName = rs.getString(4);
               String Contains = rs.getString(5);
               String DosageForm = rs.getString(6);
               String Manufacturer = rs.getString(7);
               String Price = rs.getString(8);
               medicine New = new medicine(id, DrugsFor, DrugClass, BrandName, Contains, DosageForm, Manufacturer, Price);
               tot.add(New);
            }
            return tot;
        } catch (SQLException ex) {
            return tot;
            //Logger.getLogger(operations.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
    public medicine searchById( int did ){
        medicine med = null;
        
        String sql = "SELECT * FROM `medicine_list` WHERE `id` = "+did+"";
        try{
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
               int id = Integer.parseInt(rs.getString(1));
               String DrugsFor = rs.getString(2);
               String DrugClass = rs.getString(3);
               String BrandName = rs.getString(4);
               String Contains = rs.getString(5);
               String DosageForm = rs.getString(6);
               String Manufacturer = rs.getString(7);
               String Price = rs.getString(8);
               medicine nmed = new medicine(id, DrugsFor,DrugClass,BrandName,Contains,DosageForm,Manufacturer, Price );
               return nmed;
            }
            return med;
        }catch( NumberFormatException | SQLException e ){
            System.out.println("error!");
        }
        return med;
    }
    
    public ArrayList<Integer> searchByOthers( String txt, String type){
        ArrayList<Integer> tot = new ArrayList<>();
        String sql = "SELECT `id` FROM `medicine_list` WHERE `"+type+"` like '%"+txt+"%'";
        try{
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
                int id = Integer.parseInt(rs.getString(1));
                tot.add( id );
            }
            return tot;
        }catch(NumberFormatException | SQLException e ){
            System.out.println("error");
        }
        return tot;
    }
    
    public boolean isExist( int id ){
        String sql = "SELECT * FROM `medicine_list` WHERE `id` = "+id+"";
        try{
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
                return true;
            }
        }catch( NumberFormatException | SQLException e ){
            System.out.println("error!");
            return false;
        }
        
        return false;
    }
    
    public int trimId( String txt ){
        String num = "";
        for( int i = 3; i < txt.length(); i++ ){
            num = num + txt.charAt(i);
        }
        int val = Integer.parseInt(num);
        return val;
    }
    public int trimIdDel( String txt ){
        String num = "";
        for( int i = 6; i < txt.length(); i++ ){
            num = num + txt.charAt(i);
        }
        int val = Integer.parseInt(num);
        return val;
    }

}
