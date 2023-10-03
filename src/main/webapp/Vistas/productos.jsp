<%@page import="ModelosDAO.ProductoDAO"%>
<%@page import="Modelos.Producto"%>
<%@page import="Modelos.Proveedor"%>
<%@page import="ModelosDAO.ProveedorDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Categoria"%>
<%@page import="ModelosDAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("btn_remover_categoria") != null){

        int id = Integer.parseInt(request.getParameter("btn_remover_categoria"));
        CategoriaDAO cat = new CategoriaDAO();
        cat.eliminar(id);
    }
    
    if(request.getParameter("btn_remover_proveedor") != null){

        int id = Integer.parseInt(request.getParameter("btn_remover_proveedor"));
        ProveedorDAO proveedor = new ProveedorDAO();
        proveedor.eliminarProveedor(id);
         
    }
    
if(request.getParameter("btn_remover_producto") != null){

        int id = Integer.parseInt(request.getParameter("btn_remover_producto"));
        ProductoDAO producto = new ProductoDAO();
        producto.eliminarProducto(id);
         
    }
%>
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
            <div class="container text-center">
                <h1>Gestionar categorías</h1>
                <div class="container border shadow rounded" style="padding-top: 10px; margin-bottom: 20px;">
                    <%
                        if(request.getParameter("btn_nueva_categoria") != null){
                            if(!(request.getParameter("categoria_nueva").isEmpty())){
                                String nombre = request.getParameter("categoria_nueva");
                                
                                CategoriaDAO cat = new CategoriaDAO();
                                Categoria categoria = new Categoria();
                                
                                categoria.setNombreCategoria(nombre);
                                cat.agregarCategoria(categoria);
                                response.sendRedirect("productos.jsp");
                                
                            }
                        }
                    %>
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
                                for(Categoria categoria : lista2){
                                
                            %>
                            <tr>
                                <td><%= categoria.getIdCategoria() %></td>
                                <td><%= categoria.getNombreCategoria()%></td>
                                <td>
                                    <button type="submit" name="btn_remover_categoria" 
                                    class="btn btn-danger btn-sm" value="<%= categoria.getIdCategoria() %>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </button>
                                    <button type="submit" name="btn_update_categoria" 
                                    class="btn btn-warning btn-sm" value="<%= categoria.getIdCategoria() %>">
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
            <div class="container text-center">
                <h1>Gestionar productos</h1>
                <div class="container border shadow rounded" style="padding-top: 10px; margin-bottom: 20px;">
        
                     <%
                    if(request.getParameter("btn_nuevo_producto") != null){
                        if(!(request.getParameter("nombre_producto").isEmpty()) &&
                           !(request.getParameter("categoria_producto").isEmpty()) &&
                           !(request.getParameter("proveedor_producto").isEmpty()) &&
                           !(request.getParameter("precio_producto").isEmpty()) &&
                           !(request.getParameter("ofertado_producto").isEmpty()) &&
                           !(request.getParameter("precio_oferta").isEmpty()) &&
                           !(request.getParameter("existencias").isEmpty()) &&
                           !(request.getParameter("descripcion_producto").isEmpty()) &&
                           !(request.getParameter("imagen_producto").isEmpty())){
                            
                            String nombre = request.getParameter("nombre_producto");
                            String categoria = request.getParameter("categoria_producto");
                            CategoriaDAO catprod = new CategoriaDAO();
                            int idcat = catprod.ObtenerId(categoria);
                            String provee = request.getParameter("proveedor_producto");
                            ProveedorDAO provprod = new ProveedorDAO();
                            int idprod = provprod.ObtenerId(provee);
                            double precio = Double.parseDouble(request.getParameter("precio_producto"));
                            int ofertado = 0;
                            if(request.getParameter("ofertado_producto").equals("Sí"))
                                ofertado = 1;
                            double precio_oferta = Double.parseDouble(request.getParameter("precio_oferta"));
                            int existencias = Integer.parseInt(request.getParameter("existencias"));
                            String descripcion = request.getParameter("descripcion_producto");
                            String imagen = request.getParameter("imagen_producto");
                            
                            Producto prod = new Producto();
                            ProductoDAO proddao = new ProductoDAO();
                            prod.setIdCategoria(idcat);
                            prod.setIdProveedor(idprod);
                            prod.setNombreProducto(nombre);
                            prod.setPrecioNormal(precio);
                            prod.setOfertado(ofertado);
                            prod.setPrecioOferta(precio_oferta);
                            prod.setExistencias(existencias);
                            prod.setDescripcion(descripcion);
                            prod.setImagen(imagen);
                            
                            proddao.agregarProducto(prod);
                            response.sendRedirect("productos.jsp");
                        }
                    }
                %>
                    <!-- 3.1 Nuevo producto -->
                    <form class="bg-light border" method="POST" style="padding: 20px;">
                        <div class="row">
                            <div class="col-3 mb-3">                    
                                <label>Nombre:</label>
                                <input type="text" name="nombre_producto" class="form-control"
                                placeholder="Nombre de producto...">
                            </div>  
                            <div class="col-3 mb-3">                    
                                <label>Categoría:</label>
                                <select class="form-control text-center" type="input" 
                                        name="categoria_producto">           
                                    <%
                                        CategoriaDAO categoriadao = new CategoriaDAO();
                                        List<Categoria> listaCat = new ArrayList<>();
                                        listaCat = categoriadao.listarNombreCategoria();
                                        for(Categoria categoria : listaCat){
                                     %>
                                    <option><%= categoria.getNombreCategoria() %></option>
                                    <%}%>
                                </select>
                            </div> 
                            <div class="col-3 mb-3">                    
                                <label>Proveedor:</label>
                                <select class="form-control text-center" type="input" 
                                        name="proveedor_producto">
                                    <%
                                        ProveedorDAO proveedordao = new ProveedorDAO();
                                        List<Proveedor> listaProv = new ArrayList<>();
                                        listaProv = proveedordao.listarNombreProveedor();
                                        for(Proveedor proveedor : listaProv){
                                     %>
                                    <option><%=proveedor.getNombreProveedor()%></option>
                                    <%}%>
                                </select>
                            </div> 
                            <div class="col-3 mb-3">                    
                                <label>Precio:</label>
                                <input type="number" step="0.01" name="precio_producto" class="form-control"
                                placeholder="Ingrese un precio...">
                            </div>  
                            <div class="col-3 mb-3">                    
                                <label>En oferta:</label>
                                <select class="form-control text-center" type="input" 
                                        name="ofertado_producto">
                                    <option>No</option>
                                    <option>Sí</option>
                                </select>
                            </div> 
                            <div class="col-3 mb-3">                    
                                <label>Precio en oferta:</label>
                                <input type="number" step="0.01" 
                                       name="precio_oferta" class="form-control"
                                placeholder="Ingrese un precio en oferta...">
                            </div>  
                            <div class="col-3 mb-3">                    
                                <label>Existencias:</label>
                                <input type="number" name="existencias" class="form-control"
                                placeholder="Número de existencias...">
                            </div>  
                            <div class="col-12 mb-4">                    
                                <label>Descripción:</label>
                                <input type="text" name="descripcion_producto" class="form-control"
                                placeholder="Ingrese una descripción del producto...">
                            </div>
                            <div class="col-9">                    
                                <label>Imágen (URL):</label>
                                <input type="text" name="imagen_producto" class="form-control"
                                placeholder="Ingrese URL de imágen...">
                            </div>  
                            <div class="col-3">
                                <label>⠀</label><br>
                                <button type="submit" name="btn_nuevo_producto" class="btn btn-outline-dark btn-md btn-block">
                                    Registrar nuevo producto
                                </button>
                            </div> 
                        </div>    
                    <br>   
        
                    <!-- 3.2 Tabla de productos -->
                    <table class="table table-striped table-bordered text-center align-middle" style="text-align: center; font-size: 12px;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Categoría</th>
                                <th>Proveedor</th>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Ofertado</th>
                                <th>Precio/Oferta</th>
                                <th>Existencias</th>
                                <th>Descripción</th>
                                <th>Imágen</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Producto> lista3 = new ArrayList<>();
                                ProductoDAO daoprod = new ProductoDAO();
                                lista3 = daoprod.listarProductos();
                                for(Producto prod : lista3){
                                String op = "";
                                        if(prod.getOfertado() == 1)
                                            op = "Sí";
                                        else
                                            op = "No";
                            %>
                            <tr>
                                <td style="vertical-align:middle;"><%=prod.getIdProducto()%></td>
                                <td style="vertical-align:middle;"><%=prod.getNombre_cat()%></td>
                                <td style="vertical-align:middle;"><%=prod.getNombre_prov()%></td>
                                <td style="vertical-align:middle;"><%=prod.getNombreProducto()%></td>
                                <td style="vertical-align:middle;"><%=prod.getPrecioNormal()%></td>
                                <td style="vertical-align:middle;"><%=op%></td>
                                <td style="vertical-align:middle;"><%=prod.getPrecioOferta()%></td>
                                <td style="vertical-align:middle;"><%=prod.getExistencias()%></td>
                                <td style="vertical-align:middle;"><%=prod.getDescripcion()%></td>
                                <td style="vertical-align:middle;"><img src="<%=prod.getImagen()%>" height="60px" width="60px"></td>
                                <td style="vertical-align:middle;">
                                    <button type="submit" name="btn_remover_producto" 
                                    class="btn btn-danger btn-sm" value="<%=prod.getIdProducto()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </button>
                                    <button type="submit" name="btn_update_producto" 
                                    class="btn btn-warning btn-sm" value="<%=prod.getIdProducto()%>">
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
