<%
HttpSession sesion = request.getSession();

    if(sesion.getAttribute("user_logged") == null){
        response.sendRedirect("login.jsp");
    }
    

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp"></jsp:include>
        </header>
        <div class="container m-5" style="background-color: rgb(221, 229, 229);">
            <h2>LISTAR PRODUCTOS </h2>
            <div class="row m-2">
                <div class="col-4 m-2">
                    <div class="card text-center" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">Nombre prod</h5>
                          <p class="card-text">$Precio</p>
                          <p>Descripcion</p>
                          <button class="btn btn-success">Agregar a carrito</button>
                        </div>
                      </div>
                </div>
            </div>
        </div>
    </body>
</html>
