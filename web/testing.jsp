<%-- 
    Document   : testing
    Created on : Jul 29, 2018, 9:31:42 PM
    Author     : swapn
--%>

<%@page import="javafx.util.Pair"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="delivery.medicine"%>
<%@page import="delivery.operations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="delivery.insertOperation" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>testing page</title>
    </head>
    <body>
        <%
            
            String typ = request.getParameter("submit");
            //out.println( typ );
            /*
            
            HttpSession ses = request.getSession();
            ArrayList<Integer> ass = (ArrayList<Integer>)ses.getAttribute("searchResult");
            for( int i: ass ){
                out.println( i );
            }
*/
            
            if( "Register".equals(typ) ){
                String name = request.getParameter("name");
                String uname = request.getParameter("uname");
                String pass = request.getParameter("pass");
                String address = request.getParameter("address");
                String phn = request.getParameter("phn");
                String type = "Customer";
                try{
                   insertOperation obj = new insertOperation();
                    obj.addNewUser(uname, pass, name, address, phn, type); 
                    response.sendRedirect("http://localhost:8080/DeliveryServer/HomePage.jsp");
                }catch(Exception e ){
                    System.out.println("");
                    response.sendRedirect("http://localhost:8080/DeliveryServer/register.html");
                }
            }else if("AddMedicine".equals(typ) ){
                String DrugsFor = request.getParameter("DrugsFor");
                String DrugClass = request.getParameter("DrugClass");
                String BrandName = request.getParameter("BrandName");
                String Contains = request.getParameter("Contains");
                String DosageForm = request.getParameter("DosageForm");
                String Manufacturer = request.getParameter("Manufacturer");
                String Price = request.getParameter("Price");
                try{
                   insertOperation obj = new insertOperation();
                   
                    obj.addNewMedicine(DrugsFor, DrugClass, BrandName, Contains, DosageForm, Manufacturer, Price);
                    response.sendRedirect("http://localhost:8080/DeliveryServer/HomePage.jsp");
                }catch(Exception e ){
                    System.out.println("");
                    response.sendRedirect("http://localhost:8080/DeliveryServer/AddMedicine.html");
                }
            }else if( "Search".equals(typ) ){
                String val = request.getParameter("searchOptions");
                HttpSession ses = request.getSession();
                if( "1".equals(val) ){
                    try{
                        operations obj = new operations();
                        String id = request.getParameter("search");
                        //out.println(id);
                        if( obj.isExist(Integer.parseInt(id)) ){
                            if( (ArrayList<Integer>)ses.getAttribute("searchResult") != null ){
                                ArrayList<Integer> ass = (ArrayList<Integer>)ses.getAttribute("searchResult");
                                ass.add(Integer.parseInt(id));
                                ses.setAttribute("searchResult", ass);
                            }else{
                                ArrayList<Integer> arr = new ArrayList<>();
                                arr.add(Integer.parseInt(val));
                                ses.setAttribute("searchResult", arr);
                                
                            }
                        }                     
                    }catch(Exception e ){
                        out.println("Error");
                    }
                    
                }else{
                    String searchBy = "";
                    if( "2".equals(val) ){
                        searchBy = "DrugsFor";
                    }else if( "3".equals(val) ){
                        searchBy = "DrugClass";
                    }else if( "4".equals(val) ){
                        searchBy = "BrandName";
                    }else if( "5".equals(val) ){
                        searchBy = "Contains";
                    }
                    
                    try{
                        String txt = request.getParameter("search");
                        operations obj = new operations();
                        ArrayList<Integer> tot = obj.searchByOthers(txt, searchBy );
                        ses.setAttribute("searchResult", tot);
                        
                        
                    }catch(Exception e ){
                        out.println("Error!");
                    }
                }
                RequestDispatcher requestDispatcher; 
                requestDispatcher = request.getRequestDispatcher("/orderMedicine.jsp");
                requestDispatcher.forward(request, response);
            }else if(typ.length() > 2 && typ.charAt(0) == 'A' && typ.charAt(1) == 'D' && typ.charAt(2) == 'D' ){
                //out.println("here");
                try{
                    HttpSession ses = request.getSession();
                    operations obj = new operations();
                    int id = obj.trimId(typ);
                    out.println("<br></br>");
                    out.println( id );
                    if( (Set<Integer>)ses.getAttribute("cart") != null ){
                        Set<Integer> tot = (Set<Integer>)ses.getAttribute("cart");
                        tot.add(id);
                        ses.setAttribute("cart", tot);
                    }else{
                        Set<Integer> arr = new HashSet<>();
                        arr.add(id);
                        ses.setAttribute("cart", arr);       
                    }
                    
                }catch(Exception e ){
                    out.println("Error");
                }
                RequestDispatcher requestDispatcher; 
                requestDispatcher = request.getRequestDispatcher("/orderMedicine.jsp");
                requestDispatcher.forward(request, response);
                
            }else if( typ.length() > 5 && typ.charAt(0) == 'D' && typ.charAt(1) == 'E' && typ.charAt(2) == 'L'){
                try{
                    operations obj = new  operations();
                    int id = obj.trimIdDel(typ);
                    HttpSession ses = request.getSession();
                    if( (Set<Integer>)ses.getAttribute("cart") != null ){
                        Set<Integer> tot = (Set<Integer>)ses.getAttribute("cart");
                        tot.remove(id);
                        ses.setAttribute("cart", tot);
                    }
                    
                }catch(Exception e ){
                    out.println("Error");
                }
                RequestDispatcher requestDispatcher; 
                requestDispatcher = request.getRequestDispatcher("/cart.jsp");
                requestDispatcher.forward(request, response);
            }else if("Confirm Order".equals(typ) ){
                
                out.println("astese");

                
                HttpSession ses = request.getSession();
                String pList = "", qList = "";
                if( (Set<Integer>)ses.getAttribute("cart") != null ){
                    String uname = (String)ses.getAttribute("uname");
                    Set<Integer> tot = (Set<Integer>)ses.getAttribute("cart");
                    Iterator<Integer> it = tot.iterator();
                    double totBill = 0;
                    String olist = "pid ----- quantity\n";
                    while(it.hasNext()){
                        String id = it.next().toString();
                        String quantity = request.getParameter(id);
                        operations op = new operations();
                        
                        
                        int a = Integer.parseInt(id);
                        int b = Integer.parseInt(quantity);
                        double c = op.getPrice( a );
            
                        totBill += ( b * c );
                        
                        olist += id;
                        olist += " ---- ";
                        olist += b;
                        olist += "\n";
                          
                    }
                    out.println("totalBILL " + totBill );
                    try{
                        insertOperation op = new insertOperation();
                        op.addOrder(uname, olist, totBill+"");
                        RequestDispatcher requestDispatcher; 
                        requestDispatcher = request.getRequestDispatcher("/HomePage.jsp");
                        requestDispatcher.forward(request, response);
                        out.println("Done");
                    }catch( Exception e ){
                        out.println("Error");
                    }
                }
                

            }else if( "logout".equals(typ)){
                HttpSession ses = request.getSession();
                session.invalidate();
                ses.invalidate();
                response.sendRedirect(request.getContextPath() + "/firstPage.html");
            }
            out.println("here");

        %>
    </body>
</html>
