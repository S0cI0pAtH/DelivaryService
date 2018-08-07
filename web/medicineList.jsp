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
            <h1>Delivery Service</h1>
        </div>
        <hr/>
        <div class="log"> 
        <form name="home" action="HomePage.jsp">
            <input type="submit" value="Home" name="hp" />
        </form>
            <table border="1" width="1" cellspacing="1" cellpadding="1" class="table" align="center" id="customers">
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
        </div>               
    </body>
</html>
