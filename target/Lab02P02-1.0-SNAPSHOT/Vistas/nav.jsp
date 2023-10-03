<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand">MiniTiendita</a>

                <div class="d-flex align-items-center"> <!-- Utiliza d-flex y align-items-center para alinear elementos horizontalmente -->
                    <ul class="navbar-nav"> <!-- Utiliza ml-auto y d-flex para alinear a la derecha -->
                        <form id="loginForm" action="Vistas/login.jsp" method="post">
                            <button class="btn btn-danger" type="submit">Iniciar Sesión</button>
                        </form>
                    </ul>
                    <ul class="navbar-nav ml-2"> <!-- Agrega un margen a la izquierda de 2px -->
                        <form id="registerForm" action="Vistas/registro.jsp" method="post">
                            <button class="btn btn-danger" type="submit">Registrarse</button>
                        </form>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
