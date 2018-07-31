<%-- 
    Document   : medicineList
    Created on : Jul 30, 2018, 2:20:42 PM
    Author     : swapn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="delivery.medicine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="delivery.operations" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                </tr>
            </thead>
            <tbody>
                <%
                    try{
                        operations obj = new operations();
                        ArrayList<medicine> tot = obj.medicineList();
                        for( medicine i: tot ){%>
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
                            <%
                        }
                    }catch(Exception e){
                        out.println("could not find the list");
                    }
                    %>
                
            </tbody>
        </table>

    </body>
</html>
