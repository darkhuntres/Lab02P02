<%@page import="Modelos.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModelosDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModelosDAO.ProductoDAO;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp"></jsp:include>
            </header>
            <div class="container">
                <h1>Lista de Productos</h1>
                <div class="row">
                <%
                    // Importa la clase ProductoDAO

                    // Crea una instancia de ProductoDAO
                    ProductoDAO productoDAO = new ProductoDAO();

                    // Obtiene la lista de productos
                    ArrayList<Producto> listaProductos = productoDAO.listarProductos();

                    // Itera a través de la lista de productos
                    for (Producto producto : listaProductos) {
                %>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="<%= producto.getImagen()%>" class="card-img-top" alt="Imagen del producto">
                        <div class="card-body">
                            <h5 class="card-title"><%= producto.getNombreProducto()%></h5>
                            <p class="card-text">Precio: $<%= producto.getPrecioNormal()%></p>
                            <p class="card-text">Existencias: <%= producto.getExistencias()%></p>
                            <a href="#" class="btn btn-primary">Agregar al Carrito</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>