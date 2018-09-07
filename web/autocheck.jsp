<!DOCTYPE html>
<html>
<body>

<p>When you submit the form, a function is triggered which alerts some text.</p>

<form action="autocheck.jsp" onsubmit="myFunction()">
  Enter name: <input type="text" name="fname">
  <input type="submit" value="Submit">
  
  <%
      String bal = request.getParameter("fname");
      out.print(bal);
      %>
</form>

<script>
function myFunction() {
    alert("The form was submitted");
}
</script>

</body>
</html>