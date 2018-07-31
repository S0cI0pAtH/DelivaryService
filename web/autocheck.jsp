<%-- 
    Document   : autocheck
    Created on : Jul 31, 2018, 2:51:13 PM
    Author     : swapn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script> 
            function sum() {
            var txtFirstNumberValue = document.getElementById('txt1').value;
            var txtSecondNumberValue = document.getElementById('txt2').value;
            var result = parseInt(txtFirstNumberValue) + parseInt(txtSecondNumberValue);
            if (!isNaN(result)) {
                <% String val = "10";%>
                var extra = parseInt(<%=val%>);
                result = result + extra;
                document.getElementById('txt3').value = result;
            }
            <% HttpSession ses = request.getSession();%>
        }
        </script>
    </head>
    <body>
        <input type="text" id="txt1"  onkeyup="sum();" />
        <input type="text" id="txt2"  onkeyup="sum();" />
        <input type="text" id="txt3" />
    </body>
</html>
