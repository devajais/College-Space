<%-- 
    Document   : gotocollege1
    Created on : 10 Apr, 2022, 12:42:18 PM
    Author     : Devashish Jaiswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style>
      body{
        margin-top: 70px;
        padding: 3% 15%;

      }
form{
  margin-left: 35%;
  margin-right: 35%;
}

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
        <title>GO TO COLLEGE-1</title>
    </head>
    <body>
        
         <%
              response.setHeader("cache-control","no-cache, no-store, must-revalidate");
                
                String id = request.getParameter("id");
                String pass = request.getParameter("password");
                String type = request.getParameter("AdminType");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
                String query = "select * from facultydb";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                int z=1;
                        
                        %>
        <form action="gotocollege2.jsp" method="post">
    <h1 class="h3 mb-3 fw-normal" style="
      font-family: 'Overpass', sans-serif;"
    >Faculty Query</h1>
  <div class="form-floating">
    <select name="faculty" class="form-control" id="floatingInput">
    <option value="none" hidden>--</option>
    <% 
                while(rs.next())
                { 
                %>
                <option value=<%out.print(rs.getString(1));%>><% out.print(rs.getString(2)+", "+rs.getString(3));%></option>
             <% } %>
    </select>
      <label for="floatingInput" autofocus>Choose Faculty</label>
    </div>
    <div class="form-floating">
    <select name="posttype" class="form-control" id="floatingInput">
    <option value="none" hidden>--</option>
    <option value="Announcement">Announcement</option>
    <option value="Assignment">Assignment</option>
    <option value="Notes">Notes</option>
    <option value="Fire-Annoucement">FIRE Announcement</option>
    </select>
      <label for="floatingInput" autofocus>Choose Type</label>
    </div>
    <div class="form-floating">
    <button class="w-100 btn btn-lg btn-primary" type="submit">Search</button>
  </form>
    </body>
</html>
