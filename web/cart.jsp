<%-- 
    Document   : cart
    Created on : Jul 31, 2018, 4:10:31 AM
    Author     : swapn
--%>

<%@page import="delivery.medicine"%>
<%@page import="delivery.operations"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript" > 
            function sum() {
                var total = 0;
               <%
                   HttpSession ses1 = request.getSession();
                   if( (Set<Integer>)ses1.getAttribute("cart") != null ){
                       Set<Integer> tot = (Set<Integer>)ses1.getAttribute("cart");
                       Iterator<Integer> it = tot.iterator();
                       while(it.hasNext()){
                           int id = it.next();
                           String sid = id + "";
                           String pid = "p"+sid;
                           
                           %>
                              var ex = document.getElementById('<%=sid%>').value;
                              
                              var pr = document.getElementById('<%=pid%>').value;
               
                              var db = parseFloat(pr);
                              var extra = parseInt(ex);
                              total = total + ( db * extra );
                           <%
                       }
                   }else{
                       %>
                       total = -1;
                       <%
                   }
               %>
                       
                document.getElementById('billme').value = total;
                    
                
            
            }
        </script>
    </head>
    <body>
        <h1> Ordered Medicine Lists </h1>
        <table border="1" width="1" cellspacing="1" cellpadding="1">
            <thead>
                <tr>
                    <th>Drug Id</th>
                    <th>Drugs For</th>
                    <th>Drug Class</th>
                    <th>Brand Name</th>
                    <th>Contains</th>
                    <th>Dosage Form</th>
                    <th>Manufacturer</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                
                    <%
                        HttpSession ses = request.getSession();
                        if( (Set<Integer>)ses.getAttribute("cart") != null ){
                           Set<Integer> tot = (Set<Integer>)ses.getAttribute("cart");
                           Iterator<Integer> it = tot.iterator();
                           while(it.hasNext()){
                                int id = it.next();
                                try{
                                    operations obj = new operations();
                                    medicine i = obj.searchById(id);
                                    %>
                                    <tr>
                                        <td><textarea rows="2" cols="5" name = "DrugClass" disabled> <% out.println( i.id ); %> </textarea></td>
                                        <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.DrugsFor ); %> </textarea></td>
                                        <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.DrugClass ); %> </textarea></td>
                                        <td><textarea rows="2" cols="15" name = "DrugClass" disabled> <% out.println( i.BrandName ); %> </textarea></td>
                                        <td><textarea rows="2" cols="30" name = "DrugClass" disabled> <% out.println( i.Contains ); %> </textarea></td>
                                        <td><textarea rows="2" cols="15" name = "DrugClass" disabled> <% out.println( i.DosageForm ); %> </textarea></td>
                                        <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.Manufacturer ); %> </textarea></td>
                                        <td><input  id="p<%=i.id%>" onkeyup="sum();" value = "<%=i.Price%>" disabled="disabled" ></td>
                                        <td><input  id="<%=i.id%>" onkeyup="sum();" value = "0"></td>
                                        <form name="remove" action="testing.jsp">
                                        <td><input type="submit" value="DELETE<%=i.id%>" name="submit" style="height:50px; width:80px" /></td>
                                        </form>
                                    </tr>
                                    <%
                                }catch(Exception e ){
                                    out.println("Error");
                                }
                           }
                        }
                        
                    %>
            
                
            </tbody>
        </table>
                  
                    
                    <h1>Total Bill: </h1> 
                    <input type="text" id ="billme" value="" />

    </body>
</html>
