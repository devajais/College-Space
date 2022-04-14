<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

    <%@ page import="java.util.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Faculty Section</title>

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


    <!-- Custom styles for this template -->
    <link href="css/join/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
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
                if(type.equals("HigherAuthority")){
                        
                        
                        z=2;
                        
                session.setAttribute("id", id);
                session.setAttribute("pass", pass);
                        
                 response.sendRedirect("bietHA.jsp");
                     
                        }
                while(rs.next())
                {
                    if(id.equals(rs.getString(1)))
                    {
                        if(pass.equals(rs.getString(4)))
                        {
                        out.print("<h1>"+"Hello, "+rs.getString(2)+". You are logged in"+"</h1>");
                        z=2;
                        %>
                        <nav id="navindex" class="navbar navbar-expand-lg navbar-light">

        <img src="images/bansal_logo.png" width="100px" height="100px"><a class="navbar-brand" href="#">College Space</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="#">My Posts</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">My Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login422.jsp">Logout</a>
          </li>
        </ul>
      </div>
    </nav>
<main class="form-signin">
       <h1><%out.print(id);%></h1>
  <form action="bietFaculty1.jsp" method="post">
    <h1 class="h3 mb-3 fw-normal" style="
      font-family: 'Overpass', sans-serif;"
    >Faculty Administrator</h1>
  <div class="form-floating">
    <select name="posttype" class="form-control" id="floatingInput">
    <option value="none" hidden>--</option>
    <option value="Announcement">Announcement</option>
    <option value="Assignment">Assignment</option>
    <option value="Notes">Notes</option>
    <option value="Fire-Announcement">FIRE Announcement</option>
    </select>
      <label for="floatingInput" autofocus>Choose Type</label>
    </div>
    <div class="form-floating">
      <input name="title" type="text" class="form-control" id="floatingInput" required>
      <label for="floatingInput">Title</label>
    </div>

    <div class="form-floating">
      <input name="file" type="file" class="form-control" id="floatingInput">
      <label for="floatingInput">File</label>
      <div class="form-floating">
        <input type="textarea" name="desc" class="form-control" id="floatingInput" required>
        <label for="floatingInput">Description</label>
    </div>
    <div class="form-floating">

        <input name="postedby" type="text" value=<% out.print(id); %> hidden>
        
        <%
            Format f = new SimpleDateFormat("dd-MM-YYYY");
            String str = f.format(new Date());
        %>
        <input name="datetime" type="text" value=<%out.print(str);%> hidden>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Apply</button>
  </form>
</main>
                        <%
                        break;
                        }
                    }
                    
                }
                if(z==1)
                {
                    out.print("<h1>"+"Incorrect ID/Password"+"</h1>");
                    %>
                <h3>Already have an account! <a href='login422.jsp'>Login.</a></h3>
                <h3>Or Contact to Higher Authority.</h3>
                    <%
                }
                
                %>
 
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>


  </body>
</html>
