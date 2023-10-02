<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sess = request.getSession();
     
    if (sess.getAttribute("idcliente") == null) {
        response.sendRedirect("login.jsp");
    } 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">MiniTiendita</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="productos.jsp">Productos</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="clientes.jsp">Clientes</a>
                  </li>
                </ul>
                <div class="d-flex spacing">
                    <% String nombre = (String)session.getAttribute("nombre"); %>
                    <p class="justify-content-between">Bienvenido(a), <%= nombre %> </p>
                    <div style="margin-right: 10px;"></div>
                    <button class="btn btn-danger" type="submit">Cerrar Sesión</button>
                </div>
              </div>
            </div>
          </nav>
    </body>
</html>