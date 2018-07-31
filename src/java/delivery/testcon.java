package delivery;


import java.sql.Connection;
import java.sql.DriverManager;
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
        /*
        insertOperation op = new insertOperation();
        String ack = op.addNewUser("shibli", "1234", "cg4", "kon ek jaygate", "016969", "user");
        System.out.println(ack);
        */
        /*
        deleteOperation op = new deleteOperation();
        String ack = op.removeAUser("shibli");
        System.out.println(ack);
        */
        
        /*
        updateOperation op = new updateOperation();
        String ack = op.updateUserInfo("shibli", "1234", "cg4", "kon ek jaygate", "016969", "user");
        System.out.println(ack);
        */
        /*
        operations op = new operations();
        String ack = op.isValidUser("shibli", "1234");
        System.out.println(ack);
        */
        /*
        insertOperation op = new insertOperation();
        String ack = op.addNewMedicine("ac", "ac", "ac", "ac", "ac","ac", "trht");
        System.out.println(ack);
        */
        /*
        deleteOperation op = new deleteOperation();
        String ack = op.removeAMedicine(9);
        System.out.println(ack);
        */
        /*
        operations op = new operations();
        int tot = op.total_medicine();
        System.out.println(tot);
        */
        /*
        operations op = new operations();
        ArrayList<medicine> tot = op.medicineList();
        for( medicine i: tot ){
            System.out.println(i.id );
            System.out.println(i.DrugsFor );
            System.out.println(i.BrandName );
            System.out.println(i.DrugClass );
            System.out.println(i.DosageForm);
            System.out.println(i.Contains );
            System.out.println(i.Manufacturer );
            System.out.println(i.Price );
        }
        */
        /*
        operations op = new operations();
        medicine i = op.searchById(11);
        System.out.println(i.id );
        System.out.println(i.DrugsFor );
        System.out.println(i.BrandName );
        System.out.println(i.DrugClass );
        System.out.println(i.DosageForm);
        System.out.println(i.Contains );
        System.out.println(i.Manufacturer );
        System.out.println(i.Price );
        
        */
        
        
        
        
            
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
            /*
            ArrayList<Integer> tot = new ArrayList<>();
            tot.add( 1  );
            tot.add( 2  );
            tot.add( 3  );
            tot.add( 4  );
            tot.add( 5  );
            
            for( int i = 0; i < tot.size(); i++ ){
                if( tot.get(i) == 3 ){
                    tot.remove(i);
                    
                }
            }
            for( int i: tot ){
                System.out.println(i );
            }
            */
            
            operations op = new operations();
            ArrayList<Integer> tot = op.searchByOthers("CE", "BrandName");
            for( int i: tot ){
                System.out.println(i);
            }
             
    }
    
}

/*
<tr>
                                    <td><textarea rows="2" cols="5" name = "DrugClass" disabled> <% out.println( i.id ); %> </textarea></td>
                                    <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.DrugsFor ); %> </textarea></td>
                                    <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.DrugClass ); %> </textarea></td>
                                    <td><textarea rows="2" cols="15" name = "DrugClass" disabled> <% out.println( i.BrandName ); %> </textarea></td>
                                    <td><textarea rows="2" cols="30" name = "DrugClass" disabled> <% out.println( i.Contains ); %> </textarea></td>
                                    <td><textarea rows="2" cols="15" name = "DrugClass" disabled> <% out.println( i.DosageForm ); %> </textarea></td>
                                    <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.Manufacturer ); %> </textarea></td>
                                    <td><textarea rows="2" cols="10" name = "DrugClass" disabled> <% out.println( i.Price ); %> </textarea></td>
                                </tr>
*/