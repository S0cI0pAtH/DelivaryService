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
public class medicine {
    public int id;
    public String DrugsFor,DrugClass,BrandName ,Contains ,DosageForm ,Manufacturer ,Price ;
    medicine(int id,String DrugsFor,String DrugClass,String BrandName ,String Contains ,String DosageForm ,String Manufacturer ,String Price ){
        this.id = id;
        this.DrugsFor = DrugsFor;
        this.BrandName = BrandName;
        this.Contains = Contains;
        this.DosageForm = DosageForm;
        this.DrugClass = DrugClass;
        this.Manufacturer = Manufacturer;
        this.Price = Price;
    }
}
