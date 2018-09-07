/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delivery;

/**
 *
 * @author swapn
 */
public class order {
    String userName, DrugClass, price, quantity;
    order(String userName,String DrugClass,String price,String quantity){
        this.DrugClass = DrugClass;
        this.price = price;
        this.quantity = quantity;
        this.userName = userName;
    }
}
