<%-- 
    Document   : logout
    Created on : 1 oct. 2023, 13:29:09
    Author     : melan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Obtener el valor del campo oculto "logout"
    String logout = request.getParameter("logout");

    if ("true".equals(logout)) {
        // Cerrar la sesión
        session.invalidate();
        response.sendRedirect("login.jsp");
    } else {
        // Redirigir al usuario a la página de inicio o realizar cualquier otra acción necesaria
        response.sendRedirect("comprar.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
