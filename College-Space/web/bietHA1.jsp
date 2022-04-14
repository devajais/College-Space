<%-- 
    Document   : firetemp
    Created on : 13 Apr, 2022, 8:55:52 PM
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
        
                response.setHeader("cache-control","no-cache, no-store, must-revalidate");
                
                String title = request.getParameter("title");
                String date = request.getParameter("date");
                String file = request.getParameter("file");
                String desc = request.getParameter("desc");
                String postedby = request.getParameter("postedby");
               
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
                    
                String q1 = "insert into fireannouncement values('"+title+"','"+desc+"','"+file+"','"+postedby+"','"+date+"')";
               
                PreparedStatement ps2 = con2.prepareStatement(q1);
                ps2.execute();
                con2.close();
                %>
                <script>
            alert("Done!")
            
            
        </script>
        <%
                response.sendRedirect("bietHA.jsp");
                
        %>
        
    </body>
</html>
