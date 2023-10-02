<%-- 
    Document   : admin
    Created on : 29 sep. 2023, 10:28:52
    Author     : melan
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Cliente"%>
<%@page import="ModelosDAO.ClienteDAO"%>
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
            <jsp:include page="navbar_admin.jsp"></jsp:include>
        </header>
        <div class="container-fluid m-2">
            <div class="container text-center">
                <h2>Gestionar clientes</h2>
                <div class="container border shadow rounded" style="padding-top: 10px; margin-bottom: 20px;">
        
                    <!-- 1.2 Tabla de clientes -->
                    <table class="table table-striped table-bordered text-center align-middle" style="text-align: center; font-size: 14px;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Sexo</th>
                                <th>Dirección</th>
                                <th>Teléfono</th>
                                <th>Paí­s</th>
                                <th>Correo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ClienteDAO clt = new ClienteDAO();
                                List<Cliente> lista = new ArrayList<>();
                                lista = clt.listarClientes();
                                for(Cliente cliente : lista){
                                
                            %>
                            <tr>
                                <td><%= cliente.getIdCliente() %></td>
                                <td><%= cliente.getNombres()%></td>
                                <td><%= cliente.getApellidos() %></td>
                                <td><%= cliente.getSexo()%></td>
                                <td><%= cliente.getDireccion()%></td>
                                <td><%= cliente.getTelefono()%></td>
                                <td><%= cliente.getPais()%></td>
                                <td><%= cliente.getCorreo()%></td>
                                <td> 
                                     <button type="submit" name="btn_remover_cliente" 
                                    class="btn btn-outline-danger btn-sm" value="">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </button>
                                    <button type="submit" name="btn_update_cliente" 
                                    class="btn btn-outline-success btn-sm" value="">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                            <%
                                
                                }
                            %>
                        </tbody>
                    </table>
                    </form>
                </div><br>
            </div>
        </div>
            
    </body>
</html>