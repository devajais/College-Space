<%-- 
    Document   : gototcolllege2
    Created on : 10 Apr, 2022, 5:54:44 PM
    Author     : Devashish Jaiswal
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Go to college 2</title>
        <style>
            body{
                padding: 3% 15%;
            }
        </style>
    </head>
    <body>
        <% 
        
              response.setHeader("cache-control","no-cache, no-store, must-revalidate");
                
                String id = request.getParameter("faculty");
                String posttype = request.getParameter("posttype");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
                
                String query = "select * from post";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                
                String query1 = "select * from facultyDB";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rs1 = ps1.executeQuery();
                
                while(rs1.next()){
                    if(id.equals(rs1.getString(1))){
                        out.print("<h1>"+rs1.getString(2)+", "+posttype+"</h1>");
                        break;
                    }
                }
                
                
               
        %>
        
        <table class="table">
            
    <thead>
      <tr>
        <th>Title</th>
        <th>Description</th>
        <th>File</th>
        <th>Date</th>
      </tr>
      
    </thead>
    <tbody>
       
      <tr>
         <%
                int z=1;
                while(rs.next())
                {
                    if(id.equals(rs.getString(5)) && posttype.equals(rs.getString(1))){
                        %>
          <td><%out.print(rs.getString(2));%></td>
        <td><%out.print(rs.getString(4));%></td>
        <td><%  out.print(rs.getString(3)); %></td>
        <td><%out.print(rs.getString(6));%></td>
        
        
      </tr>
      
      <% } } %>
      
    </tbody>
  </table>
                        
                        
    </body>
</html>
