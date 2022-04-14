<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&family=Overpass:wght@900&display=swap" rel="stylesheet">
  <title>College Space</title>
  
  <style>
      
      .all-browsers {
  margin: 0;
  padding: 5px;
  background-color: skyblue;
}

.all-browsers > h1, .browser {
  margin: 10px;
  padding: 5px;
}

.browser {
  background: black;
}

.browser > h2, p {
  margin: 4px;
  font-size: 90%;
}
  </style>
  
</head>
<body>
    
    <%
        
         Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
            String query = "select * from fireannouncement";
            String query1 = "select * from facultydb";
            
                PreparedStatement ps1 = con.prepareStatement(query);
                ResultSet rs1 = ps1.executeQuery();
           
        %>
    
    
  <section id="title">
    <div class="container-fluid">
      <nav id="navindex" class="navbar navbar-expand-lg navbar-dark">

          <img src="images/bansal_logo.png" width="100px" height="100px"><a class="navbar-brand" href="#">College Space</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="login422.jsp">LoginPage</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">AboutCS</a>
            </li>
          </ul>
        </div>
      </nav>
      <div class="row">
        <div class="col-lg-6">
          <h1>Every little information </h1>
        <a href="gotocollege1.jsp"><button class="btn btn-outline-light btn-lg" type="button" name="button">Go to College</button></a>
        </div>
        <div class="col-lg-6" style='overflow: auto; width: 442px; height: 344px;'>
            
            <article class="all-browsers">
<h1>Announcements</h1>
  <%
                while(rs1.next()){
                    
                
                %>
  <article class="browser">
      <h2><% out.print(rs1.getString(1)); %></h2>
      <p><% out.print(rs1.getString(2)); %>, <button href="<% rs1.getBlob(3); %>">Download PDF</button></p>
    <h2><% out.print("-"+rs1.getString(4)); %> on <% out.print(rs1.getString(5)); %></h2>
  </article>
  <% } %>
            
        </div>
      </div>
    </div>
  </section>


  <!-- Optional JavaScript; choose one of the two! -->

  <!-- Option 1: Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

  <!-- Option 2: Separate Popper and Bootstrap JS -->
  <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>

</html>
