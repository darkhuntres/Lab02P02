<%@page import="ModelosDAO.ClienteDAO"%>
<%@page import="Modelos.Cliente"%>
<%
    ClienteDAO cliente = new ClienteDAO();
    HttpSession sesion = request.getSession();
    
    if(request.getParameter("btn_ing") != null){
        if(!(request.getParameter("username").isEmpty()) && 
        !(request.getParameter("userpass").isEmpty())){
            String correo = request.getParameter("username");
            String password = request.getParameter("userpass");
            
            Cliente cl = new Cliente();
            cl = cliente.ObtenerUsuario(correo, password);
            
            if(cl != null){
                sesion.setAttribute("user_logged", true);
                sesion.setAttribute("idCliente", cl.getIdCliente());
                sesion.setAttribute("nombre", cl.getNombres());
                if(cl.getNombres().contains("admin")){
                    response.sendRedirect("productos.jsp");
                } else{
                    response.sendRedirect("comprar.jsp");
                }
                
            } else{
                System.out.println("Error");
            }
            
        }
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            body {
                background-color: #f0f0f0; /* Cambia este valor al color de fondo que desees */
            }
            .login-box {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff; /* Color de fondo del cuadro de inicio de sesión */
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto mt-5">
                    <div class="login-box">
                        <h2 class="text-center">MiniTiendita</h2>
                        <form method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Nombre de Usuario</label>
                                <input type="text" class="form-control" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" name="userpass" required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" name="btn_ing">Iniciar Sesión</button>
                            </div>
                        </form> <br>
                        <div class="text-center">
                            <a  href="registro.jsp">¿No tienes cuenta?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
