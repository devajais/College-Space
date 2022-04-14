<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Fire Request</title>
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
         
        <h1>Fire Announcement Requests</h1>
        <table class="table">
    <thead>
      <tr>
        <th>Title</th>
        <th>Description</th>
        <th>File Upload</th>
        <th>Posted by</th>
        <th>Date</th>
      </tr>
    </thead>
    <tbody>
      <tr>
           <%
                String query = "select * from firerequest";
                PreparedStatement ps1 = con.prepareStatement(query);
                ResultSet rs1 = ps1.executeQuery();
                int z=1;
                
        List<String> list=new ArrayList<String>();
                while(rs1.next())
                {
        %>
        <td><%out.print(rs1.getString(1));%></td>
        <td><%out.print(rs1.getString(2));%></td>
        <td><%out.print(rs1.getString(3));%></td>
        <td><%out.print(rs1.getString(4));%></td>
        <td><%out.print(rs1.getString(5));%></td>
        <% list.add(rs1.getString(1)); %>
     </tr>
      <% } %>
    </tbody>
  </table>
        <form method="post" action="firetemp.jsp">
    <h1 class="h3 mb-3 fw-normal" style="
      font-family: 'Overpass', sans-serif;"
    >Approve to make FIRE</h1>
  <div class="form-floating">
    <select name="title" class="form-control" id="floatingInput">
        
      <option value="none" hidden>-----Choose Title-----</option>
    <% 
                for (String i : list)
                {
                %>
                <option value=<% out.print(i); %>><% out.print(i); %></option>
             <% } %>
    </select>
  </div>
    
    <div class="form-floating">
    <button class="w-100 btn btn-lg btn-primary" type="submit">Approve</button>
        </form>
    </body>
</html>