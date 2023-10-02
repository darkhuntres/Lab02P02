<%@page import="ModelosDAO.ClienteDAO"%>
<%@page import="Modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  
    if(request.getParameter("btn_registro") != null){
        if(!(request.getParameter("nombres").isEmpty()) &&
           !(request.getParameter("apellidos").isEmpty()) &&
           !(request.getParameter("sexo").isEmpty()) &&
           !(request.getParameter("direccion").isEmpty()) &&
           !(request.getParameter("telefono").isEmpty()) &&
           !(request.getParameter("pais").isEmpty()) &&
           !(request.getParameter("correo").isEmpty()) &&
           !(request.getParameter("clave").isEmpty())){
           
           String nombre = request.getParameter("nombres");
           String apellidos = request.getParameter("apellidos");
           String sexo = request.getParameter("sexo");
           String direccion = request.getParameter("direccion");
           String telefono = request.getParameter("telefono");
           String pais = request.getParameter("pais");
           String correo = request.getParameter("correo");
           String clave = request.getParameter("clave");
           
           Cliente cliente = new Cliente();
           cliente.setNombres(nombre);
           cliente.setApellidos(apellidos);
           cliente.setSexo(sexo);
           cliente.setDireccion(direccion);
           cliente.setTelefono(telefono);
           cliente.setPais(pais);
           cliente.setCorreo(correo);
           cliente.setClave(clave);
           
           ClienteDAO clt = new ClienteDAO();
           clt.agregarCliente(cliente);
           
           response.sendRedirect("login.jsp");
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #fff;
            }
    
            .container {
                max-width: 600px;
                background-color: #f0f0f0;
                padding: 20px;
            }
    
            .form-group {
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center mb-5">Registro de Cliente</h2>
            <form>
                <div class="form-group row">
                    <div class="col-md-4">
                        <label for="nombres">Nombres:</label>
                        <input type="text" class="form-control" name="nombres" required>
                    </div>
                    <div class="col-md-4">
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" class="form-control"  name="apellidos" required>
                    </div>
                    <div class="col-md-4">
                        <label for="sexo">Sexo:</label>
                        <select class="form-control" id="sexo" name="sexo">
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-4">
                        <label for="direccion">Dirección:</label>
                        <input type="text" class="form-control"  name="direccion">
                    </div>
                    <div class="col-md-4">
                        <label for="telefono">Teléfono:</label>
                        <input type="tel" class="form-control" name="telefono">
                    </div>
                    <div class="col-md-4">
                        <label for="pais">País:</label>
                        <input type="text" class="form-control"  name="pais">
                    </div>
                </div>
                <div class="form-group">
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" class="form-control"  name="correo" required>
                </div>
                <div class="form-group">
                    <label for="clave">Clave:</label>
                    <input type="password" class="form-control"  name="clave" required>
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary" name="btn_registro">Registrarse</button>
                </div>
            </form>
        </div>
    </body>
</html>
