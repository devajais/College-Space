
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link rel="stylesheet" href="css/styles.css">

    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Higher Authority Section</title>

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
      #HAtitle{

          padding: 3% 15%;
      }
    </style>


    <!-- Custom styles for this template -->
    <link href="css/join/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
      <%  response.setHeader("cache-control","no-cache, no-store, must-revalidate");
      
      String id = session.getAttribute("id").toString();
      String pass = session.getAttribute("pass").toString();
      Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
                String query = "select * from facultydb";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                int z=1;
                if(id.equals("Director") && pass.equals("422B"))
                    {
                       
               %>
    <section id="HAtitle">

    <nav id="navindex" class="navbar navbar-expand-lg navbar-light">

        <img src="images/bansal_logo.png" width="100px" height="100px"><a class="navbar-brand" href="#">College Space</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="facultyDB.jsp">FacultyDB</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="firerequest.jsp">Requests</a>
          </li>
        </ul>
      </div>
    </nav>
<main class="form-signin">
    <form action="bietHA1.jsp" method="post">

    <h1 class="h3 mb-3 fw-normal" style="
      font-family: 'Overpass', sans-serif;"
    >Higher Authority Administrator</h1>
  <div class="form-floating">
    <select name="posttype" class="form-control" id="floatingInput">
    <option value="Fire-Announcement">FIRE Announcement</option>
    </select>
      <label for="floatingInput">Choose Type</label>
    </div>
    <div class="form-floating">
      <input name="title" type="text" class="form-control" id="floatingInput" autofocus>
      <label for="floatingInput">Title</label>
    </div>

    <div class="form-floating">
      <input name="file" type="file" class="form-control" id="floatingInput">
      <label for="floatingInput">File</label>
      <div class="form-floating">
        <input name="desc" type="textarea" class="form-control" id="floatingInput">
        <label for="floatingInput">Description</label>
    </div>
    <div class="form-floating">
        <input name="postedby" type="text" value="Higher Authority" hidden>
        
        <%
            Format f = new SimpleDateFormat("dd-MM-YYYY");
            String str = f.format(new Date());
        %>
        <input name="date" type="text" value=<%out.print(str);%> hidden>

    <button class="w-100 btn btn-lg btn-primary" type="submit">Apply</button>
  <!--  <p class="mt-5 mb-3 text-muted">&copy; <a href="index.html">serveuservice.com</a> by <a href="https://devajais.github.io/portfolio/">Devashish Jaiswal</a></p>
  --></form>
</main>

</section>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

<%}
                else {
                    out.print("Incorrect password!");
                }
%>
  </body>
</html>
