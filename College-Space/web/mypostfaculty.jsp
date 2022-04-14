<%-- 
    Document   : mypostfaculty
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
        <title>My post Faculty</title>
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
        %>
        
        <table class="table">
            
    <thead>
      <tr>
          <th>Type</th>
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
                    if(id.equals(rs.getString(5))){
                        %>
          <td><%out.print(rs.getString(1));%></td>
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
