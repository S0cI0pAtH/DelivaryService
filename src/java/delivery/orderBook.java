/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delivery;

import java.util.ArrayList;
import javafx.util.Pair;

/**
 *
 * @author swapn
 */
public class orderBook {
    int id;
    double totalBill;
    ArrayList<Pair <Integer,Integer>> mlist;
    orderBook(int id, double totalBill,ArrayList<Pair <Integer,Integer>> mlist ){
        this.id = id;
        this.mlist = mlist;
        this.totalBill = totalBill;
    }
    
    public static void main(String[] args) {
        ArrayList<Pair <Integer,Integer>> tot = new ArrayList<>();
        Pair a = new Pair( 1, 2 );
        tot.add( a );
        
        
        System.out.println(tot.get(0).getValue());
        
    }
    
}
