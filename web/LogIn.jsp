<%-- 
    Document   : LogIn
    Created on : Jul 29, 2018, 7:53:57 PM
    Author     : swapn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="delivery.operations" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In </title>
    </head>
    
    <body> 
        <%      
            String clicked = request.getParameter("log" );
            out.print("val "+clicked);
            if( "LogIn".equals(clicked) ){
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                out.println( userName ) ;
                out.println( password );

                try{
                    operations ob = new operations();
                    if( ob.isValidUser(userName, password)){
                        HttpSession ses = request.getSession();
                        ses.setAttribute("uname", userName);
                        out.print("valid");
                        response.sendRedirect("HomePage.jsp");

                    }else{
                        response.sendRedirect("firstPage.html");

                    }
                }catch(Exception e ){
                    out.println("Error");
                }
            }
            
            
            
        
            
            
        %>

        
        
    </body>
</html>
