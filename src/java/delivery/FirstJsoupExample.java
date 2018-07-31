package delivery;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author swapn
 */
import java.io.IOException;  
import java.io.PrintWriter;
import org.jsoup.Jsoup;  
import org.jsoup.nodes.Document;  
public class FirstJsoupExample{  
    public static void main( String[] args ) throws IOException{  
                try {
        Document doc = Jsoup.connect("http://www.bddrugs.com/search.php").get();
        //System.out.print(doc);

        //write to document
        PrintWriter out = new PrintWriter("output.txt");
        out.print(doc.toString());
        out.close();
    } catch (Exception e) {
                    System.out.println("ERROR");
    }  
    }  
}  