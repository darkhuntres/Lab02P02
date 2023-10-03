<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Categoria"%>
<%@page import="ModelosDAO.CategoriaDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("btn_nueva_categoria") != null) {
        if (!(request.getParameter("categoria_nueva").isEmpty())) {
            String nombre = request.getParameter("categoria_nueva");

            CategoriaDAO cat = new CategoriaDAO();
            Categoria categoria = new Categoria();

            categoria.setNombreCategoria(nombre);
            cat.agregarCategoria(categoria);
            response.sendRedirect("productos.jsp");

        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Proveedores</title>
    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp"></jsp:include>
            </header>
            <div class="container text-center">
                <h1>Gestionar categorías</h1>
                <div class="container border shadow rounded" style="padding-top: 10px; margin-bottom: 20px;">

                    <!-- 2.1 Nueva categoría -->
                    <form class="bg-light border" method="POST" style="padding: 20px;">
                        <div class="row">
                            <div class="col-3">                    
                                <label>Nombre:</label>
                                <input type="text" name="categoria_nueva" class="form-control"
                                       placeholder="Nombre de categoría...">
                            </div>  
                            <div class="col-3">
                                <label>⠀</label><br>
                                <button type="submit" name="btn_nueva_categoria" class="btn btn-outline-dark btn-md btn-block">
                                    Registrar nueva categoría
                                </button>
                            </div> 
                        </div>    
                        <br>   

                        <!-- 2.2 Tabla de categorías -->
                        <table class="table table-striped table-bordered" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre de categoría</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                CategoriaDAO cat = new CategoriaDAO();
                                List<Categoria> lista2 = new ArrayList<>();
                                lista2 = cat.listar();
                                for (Categoria categoria : lista2) {

                            %>
                            <tr>
                                <td><%= categoria.getIdCategoria()%></td>
                                <td><%= categoria.getNombreCategoria()%></td>
                                <td>
                                    <button type="submit" name="btn_remover_categoria" 
                                            class="btn btn-danger btn-sm" value="<%= categoria.getIdCategoria()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </button>
                                    <button type="submit" name="btn_update_categoria" 
                                            class="btn btn-warning btn-sm" value="<%= categoria.getIdCategoria()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                        <%

                            }
                        %>
                    </table>
                </form>
            </div><br>
        </div>
                    
    </body>
</html>
