<%-- 
    Document   : bietFaculty1
    Created on : 10 Apr, 2022, 11:51:40 AM
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
        <title>JSP Page</title>
    </head>
    <body>
         <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            String type = request.getParameter("posttype");
            String title = request.getParameter("title");
            String file = request.getParameter("file");
            String desc = request.getParameter("desc");
            String postedby = request.getParameter("postedby");
            String datetime = request.getParameter("datetime");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
            
            try{
            if(type.equals("Fire-Announcement")){
                String q1 = "insert into firerequest values('"+title+"','"+desc+"','"+file+"','"+postedby+"','"+datetime+"')";
                PreparedStatement ps1 = con.prepareStatement(q1);
                ps1.execute();
                con.close();
            }
            else{
                String q1 = "insert into post values('"+type+"','"+title+"','"+file+"','"+desc+"','"+postedby+"','"+datetime+"')";
                PreparedStatement ps1 = con.prepareStatement(q1);
                ps1.execute();
                con.close(); 
            }
                %>
                
                <script>
                    alert("Done");
                    </script>

         <%                
                
            }
            catch(Exception e){
                out.println("<h1>"+"ERROR!"+"</h1>");
            }
            %>
    </body>
</html>
