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
               
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegespace","root","");
                
                String query = "select * from firerequest";
                PreparedStatement ps1 = con2.prepareStatement(query);
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){
                    if(title.equals(rs1.getString(1))){
                String q1 = "insert into fireannouncement values('"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"','"+rs1.getString(5)+"')";
                String q2 = "delete from firerequest where Title='"+title+"'";
                PreparedStatement ps2 = con2.prepareStatement(q1);
                PreparedStatement ps3 = con2.prepareStatement(q2);
                ps2.execute();
                ps3.execute();
                con2.close();
                
                response.sendRedirect("firerequest.jsp");
                break;
                    }
                    
                }
                
        %>
        
    </body>
</html>
