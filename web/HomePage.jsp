<%-- 
    Document   : HomePage
    Created on : Jul 29, 2018, 7:50:07 PM
    Author     : swapn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
        </style>
    </head>
    <body>
         <div class ="name">
            <h1>Delivery Service</h1>
        </div>
        <hr/>
        <div class="log">
        <form name="showMed" action="medicineList.jsp">
            <input type="submit" value="Medicine List" name="mlist" />
        </form>
        <form name="showMed" action="orderMedicine.jsp">
            <input type="submit" value="Order Medicine" name="orderMed" />
        </form>
        <form name="showMed" action="firstPage.html">
            <input type="submit" value="Log Out" name="lout" />
        </form>
        
        <%
            HttpSession ses = request.getSession();
            if( ses.getAttribute("uname") == null ){
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/firstPage.html");
                
            }
            %>
        </div>
    </body>
</html>
