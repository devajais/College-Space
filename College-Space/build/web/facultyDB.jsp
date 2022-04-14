<%-- 
    Document   : facultyDB
    Created on : 6 Apr, 2022, 4:35:51 PM
    Author     : Devashish Jaiswal
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <style>
            body{
                padding: 3% 15%;
            }
        </style>
    </head>
    <body>
        <% 
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
        %>
        <h1>Faculty DB</h1>
        
        <table class="table">
            
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Branch</th>
        <th>Password</th>
      </tr>
      
    </thead>
    <tbody>
       
      <tr>
           <%
                String query = "select * from facultydb";
                PreparedStatement ps1 = con.prepareStatement(query);
                ResultSet rs1 = ps1.executeQuery();
                int z=1;
                while(rs1.next())
                {
            
        %>
          
          <td><%out.print(rs1.getString(1));%></td>
        <td><%out.print(rs1.getString(2));%></td>
        <td><%out.print(rs1.getString(3));%></td>
        <td><%out.print(rs1.getString(4));%></td>
        
        
      </tr>
      
      <% } %>
    </tbody>
  </table>
        <form method="post" action="facultyDB1.jsp">
            ID: <input type="text" name="id" required><br>
            Name: <input type="text" name="Name" required><br>
            Branch: <input type="text" name="Branch" required><br>
            Password: <input type="password" name="Password" required><br>
            <input type="submit" value="submit">
        </form>
    </body>
</html>
