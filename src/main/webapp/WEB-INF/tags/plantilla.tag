<!DOCTYPE html>
<%@tag description="Plantilla" pageEncoding="UTF-8"%>
<%@attribute name="pagina"%> 
 
<html>
 <body>
    <!-- Menú principal -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="padding-top: 20px; 
    padding-bottom: 20px; padding-left: 60px; background-color:#1f1f1f">
        <a class="navbar-brand" href="index.jsp">DMAW</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
        data-target="#navbarmarkup" aria-controls="navbarNavAltMarkup" 
        aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarmarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="login.jsp">Login</a>
            <a class="nav-item nav-link" href="productos.jsp">Productos</a>
            <a class="nav-item nav-link" href="clientes.jsp">Clientes</a>
            <a class="nav-item nav-link" href="compra.jsp">Compra</a>
            <a class="nav-item nav-link" href="carrito.jsp">Carrito de compra</a>
            <a class="nav-item nav-link" href="cerrar_sesion.jsp">Cerrar sesión</a>
          </div>
        </div>
    </nav>

    <!-- Header -->
     <div class="container" style="padding-top: 20px; padding-bottom: 20px;">
        <header class="text-center border" style="padding-top:15px; 
        padding-bottom:15px; background-color: #dfdede;">
            <h3>Desarrollo Multiplataforma de Aplicaciones Web</h3>
            
            <h5>Período II - Actividad II</h5>
        </header>
    </div>
        
    <div class="container" style="padding-bottom: 20px;">
        <h5 class="text-center" style="padding-top:15px; padding-bottom:15px;
            background-color: #1f1f1f; color: #dfdede;"><b>${pagina}</b>
        </h5>
    </div>       
 </body>
</html>
