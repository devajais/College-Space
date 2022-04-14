<%-- 
    Document   : templogin422
    Created on : 10 Apr, 2022, 9:22:15 AM
    Author     : Devashish Jaiswal
--%>

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
            String type = request.getParameter("AdminType");
            String id = request.getParameter("id");
            String pass = request.getParameter("password");
            
                session.setAttribute("id", id);
                session.setAttribute("pass", pass);
            if(type.equals("Faculty")){
                 response.sendRedirect("bietFaculty.jsp");
                
            }
            else{
                
                 response.sendRedirect("bietHA.jsp");
            }
            %>
    </body>
</html>
