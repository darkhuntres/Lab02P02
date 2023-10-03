<%@page import="Modelos.Proveedor"%>
<%@page import="ModelosDAO.ProveedorDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <div class="container-fluid m-2">
               <div class="container text-center">
                <h1>Gestionar proveedores</h1>
                <div class="container border shadow rounded" style="padding-top: 10px; margin-bottom: 20px;">
                    <%
                        if(request.getParameter("btn_nuevo_proveedor") != null){
                            if(!(request.getParameter("nombre_proveedor").isEmpty()) &&
                                !(request.getParameter("tel_proveedor").isEmpty()) &&
                                !(request.getParameter("contacto_proveedor").isEmpty())){
                                
                                String nombre = request.getParameter("nombre_proveedor");
                                String telefono = request.getParameter("tel_proveedor");
                                String contacto = request.getParameter("contacto_proveedor");
                                
                                ProveedorDAO proveedor = new ProveedorDAO();
                                Proveedor prov = new Proveedor();
                                
                                prov.setNombreProveedor(nombre);
                                prov.setTelefono(telefono);
                                prov.setContacto(contacto);
                                
                                proveedor.agregarProveedor(prov);
                                response.sendRedirect("productos.jsp");
                                
                            }
                        }
                    %>
                    <!-- 1.1 Nuevo proveedor -->
                    <form class="bg-light border" method="POST" style="padding: 20px;">
                       
                        <div class="row">
                            <div class="col-3">                    
                                <label>Nombre:</label>
                                <input type="text" name="nombre_proveedor" class="form-control"
                                placeholder="Nombre de proveedor...">
                            </div>  
                            <div class="col-3">                    
                                <label>Teléfono:</label>
                                <input type="text" name="tel_proveedor" class="form-control"
                                placeholder="0000-0000">
                            </div>  
                            <div class="col-3">                    
                                <label>Contacto</label>
                                <input type="text" name="contacto_proveedor" class="form-control"
                                placeholder="Información de contacto...">
                            </div>  
                            <div class="col-3">
                                <label>⠀</label><br>
                                <button type="submit" name="btn_nuevo_proveedor" class="btn btn-outline-dark btn-md btn-block">
                                    Registrar nuevo proveedor
                                </button>
                            </div> 
                        </div>    
                    <br>   
        
                    <!-- 1.2 Tabla de proveedores -->
                    <table class="table table-striped table-bordered" style="text-align: center;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre de proveedor</th>
                                <th>Teléfono</th>
                                <th>Contacto</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ProveedorDAO prov = new ProveedorDAO();
                                List<Proveedor> lista = new ArrayList<>();
                                lista = prov.listarProveedores();
                                for(Proveedor proveedor : lista){
                                
                            %>
                            <tr>
                                <td><%= proveedor.getIdProveedor() %></td>
                                <td><%= proveedor.getNombreProveedor()%></td>
                                <td><%= proveedor.getTelefono()%></td>
                                <td><%= proveedor.getContacto()%></td>
                                <td>
                                    <button type="submit" name="btn_remover_proveedor" 
                                    class="btn btn-danger btn-sm" value="<%= proveedor.getIdProveedor() %>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </button>
                                    <button type="submit" name="btn_update_proveedor" 
                                    class="btn btn-warning btn-sm" value="<%= proveedor.getIdProveedor() %>">
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
        </div>
                    
    </body>
</html>
