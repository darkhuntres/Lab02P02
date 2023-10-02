<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
HttpSession sesion = request.getSession();
%>

<c:choose>
    <c:when test="${empty sessionScope.user_logged}">
        <jsp:include page="Vistas/navbar_admin.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="Vistas/navbar.jsp" />
    </c:otherwise>
</c:choose>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
