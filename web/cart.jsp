<%-- 
    Document   : cart
    Created on : Jul 31, 2018, 4:10:31 AM
    Author     : swapn
--%>

<%@page import="delivery.insertOperation"%>
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
        <style>
            .name{
                text-align: center;
                font-size: 30px;
                font-family: sans-serif;
                text-decoration: none;
            }
            .name2{
                text-align: center;
                font-size: 15px;
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
                .order{
                    text-align: center;
                }
                
        </style>
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
        <div class ="name">
            <a class="home" href="HomePage.jsp"><h1>Delivery Service</h1></a>
        </div>
        <hr/>
        <h1> Ordered Medicine Lists </h1>
        
        <table border="1" width="1" cellspacing="1" cellpadding="1" id="customers">
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
                  
                    
       <div class="name2">
           <h1>Total Bill: <input type="text" id ="billme" value="" disabled="disabled" /> </h1>
       </div>   
        
        <br></br><br></br><br></br>
        <div class="order">
        <form action="HomePage.jsp">
            <input type="submit" value="Confirm Order" name="submit" />
        </form>
        </div>

    </body>
</html>
