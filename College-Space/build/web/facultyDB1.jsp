<%-- 
    Document   : newjsp
    Created on : 9 Apr, 2022, 10:03:55 PM
    Author     : Devashish Jaiswal
--%>
<%@page import="java.sql.Statement"%>
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
        <h1>Hello World!</h1>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            String name = request.getParameter("Name");
            String id = request.getParameter("id");
            String pass = request.getParameter("Password");
            String branch = request.getParameter("Branch");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
            try{
                String q1 = "insert into facultyDB values('"+id+"','"+name+"','"+branch+"','"+pass+"')";
                PreparedStatement ps1 = con.prepareStatement(q1);
                ps1.execute();
                con.close();
                
                
                 response.sendRedirect("facultyDB.jsp");
    
            }
            catch(Exception e){
                out.println("<h1>"+"ERROR!"+"</h1>");
            }
        %>
    </body>
</html>
