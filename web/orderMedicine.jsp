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
        <style>
            .log{
                text-align: center;
                margin-bottom: 150px;
            }
            body{
		background-color: #D5DBDB;
            }
            .name{
                text-align: center;
                font-size: 30px;
                font-family: sans-serif;               
            }
            input[type=text] {
			width: 25%;
			padding: 12px 20px;
			margin: 2px 0;
			box-sizing: border-box;
			height:10px;
			
		}
		input[type=email] {
			width: 25%;
			padding: 12px 20px;
			margin: 2px 0;
			box-sizing: border-box;
			height:10px;
			
		}
		input[type=password] {
			width: 25%;
			padding: 12px 20px;
			margin: 4px 0;
			box-sizing: border-box;
			height:10px;
		}
		h3.first{
			color:#deff4f;
			margin-right:20%;
		}
		h3.Last{
			color:#deff4f;
			margin-right:20%;
		}
		h3.uname{
			color:#deff4f;
			margin-right:20%;
		}
		h3.pass{
			color:#deff4f;
			margin-right:20%;
		}
		h3.age{
			color:#deff4f;
			margin-right:16%;
                }
		div.login{
			text-align:center;
			margin-top:10%;
		}
                h3.name{
                        color:#deff4f;
			margin-right:11%;
                }
                input[type=submit] {
			width: 25%;
			background-color: #5DADE2;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			margin-top:1%;
			
		}
		input[type=submit]:hover {
			background-color: #A9CCE3;
		}
		input[type=button]{
			width: 25%;
			background-color: red;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			margin-bottom:1%;
		}
                .class{
                        text-align: center;
                }
                #customers {
                    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                }

                #customers td, #customers th {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #customers tr:nth-child(even){background-color: #f2f2f2;}

                #customers tr:hover {background-color: #ddd;}

                #customers th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #5DADE2;
                    color: white;
                }
        </style>
    </head>
    <body>
        <div class ="name">
            <a class="class" href="HomePage.jsp"><h1>Delivery Service</h1></a>
        </div>
        <hr/>
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
       
        
        
        <table border="1" width="1" cellspacing="1" cellpadding="1" id="customers" class="class">
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

                <form name="cart" action="cart.jsp" method="POST" class="class">
            <input type="submit" value="Cart" name="shorCart" />
        </form>
    </body>
</html>
