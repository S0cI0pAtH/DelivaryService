<%-- 
    Document   : orderMedicine
    Created on : Jul 30, 2018, 4:17:34 PM
    Author     : swapn
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.List"%>
<%@page import="javax.websocket.Session"%>
<%@page import="delivery.medicine"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="delivery.operations" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="searchMed" action="testing.jsp">
           <input type="text" name="search" value="" placeholder="Search" size="30" />
           <select name="searchOptions" >
               <option value = "1">Id No</option>
               <option value = "2">Drugs For</option>
               <option value = "3">Drug Class</option>
               <option value = "4">Brand Name</option>
               <option value = "5">Contains</option>
           </select>
           <input type="submit" value="Search" name="submit" /> 
        </form>
        <form name="cart" action="cart.jsp" method="POST">
            <br></br><br></br><br></br>
            <input type="submit" value="Cart" name="shorCart" style="height:30px; width:100px" />
        </form>
        
        
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
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <br></br><br></br><br></br>
            <tbody>
                
                
                <%

                    try{
                        HttpSession ses = request.getSession();
                    
                        if( (ArrayList<Integer>)ses.getAttribute("searchResult") != null ){
                            ArrayList<Integer> tot = (ArrayList<Integer>)ses.getAttribute("searchResult");
                            int sz = tot.size();
                            operations obj = new operations();
                            //out.println("connected");
                            Set<Integer> set = new HashSet<Integer>();//to clear duplocate
                            for( int ii = 0; ii < tot.size(); ii++ ){
                                medicine i = obj.searchById(tot.get(ii));
                                int szz = set.size();
                                if( i == null ){
                                    tot.remove(ii);
                                    
                                }else{
                                    set.add( tot.get(ii) );
                                    if( set.size() == szz ){
                                        tot.remove(ii);
                                    }else{
                                   
                                       String cid = tot.get(ii) + "";
                                       %>
                                       <tr>
                                            <td><textarea rows="2" cols="5" name = "DrugClass" disabled> <% out.println( i.id ); %> </textarea></td>
                                            <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.DrugsFor ); %> </textarea></td>
                                            <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.DrugClass ); %> </textarea></td>
                                            <td><textarea rows="2" cols="15" name = "DrugClass" disabled> <% out.println( i.BrandName ); %> </textarea></td>
                                            <td><textarea rows="2" cols="30" name = "DrugClass" disabled> <% out.println( i.Contains ); %> </textarea></td>
                                            <td><textarea rows="2" cols="15" name = "DrugClass" disabled> <% out.println( i.DosageForm ); %> </textarea></td>
                                            <td><textarea rows="2" cols="25" name = "DrugClass" disabled> <% out.println( i.Manufacturer ); %> </textarea></td>
                                            <td><textarea rows="2" cols="10" name = "DrugClass" disabled> <% out.println( i.Price ); %> </textarea></td>
                                            <form name="addToCart" action="testing.jsp" method="POST">
                                            <td><input type="submit" value="ADD<%=tot.get(ii)%>" name="submit" style="height:30px; width:30px" /> </td>

                                            </form>
                                        </tr>
                                       <%
                                    }
                                    
                                    
                                }
                                
                            }

                        }else{
                            out.println("null paise");
                        }
                       
                    }catch(Exception e ){
                        out.println("balsal");
                    }
                    
                    
                    
                %>

            </tbody>
        </table>

        
    </body>
</html>
