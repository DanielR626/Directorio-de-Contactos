<%@page import="com.mycompany.agendaweb.mundo.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Contacto</title>
    </head>
    <body>
        <div class="container mt-5">
            <h1>Visualizar Contacto</h1>
            <%
                Contacto contacto = (Contacto) request.getAttribute("contactoParaVisualizar");
                if (contacto == null) {
                    contacto = new Contacto(); // Solo para evitar null pointer en el JSP, manejar adecuadamente en producción
                }
            %>
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Información del Contacto</h5>
                    <p class="card-text"><strong>Nombres:</strong> <%= contacto.getNombres()%></p>
                    <p class="card-text"><strong>Apellidos:</strong> <%= contacto.getApellidos()%></p>
                    <p class="card-text"><strong>Correo electrónico:</strong> <%= contacto.getCorreo()%></p>
                    <p class="card-text"><strong>Dirección:</strong> <%= contacto.getDireccion()%></p>
                    <p class="card-text"><strong>Teléfono:</strong> <%= contacto.getCelular()%></p>
                    <a href="SvAgenda?accion=mostrarContactos" class="btn btn-primary">Volver</a>
                </div>
            </div>
        </div>
    </body>
</html>
<style>
            body {
                background-image: url('https://i.pinimg.com/originals/a2/b2/0c/a2b20cad9728d2ea8fb07e1e0a8b00c8.gif');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            .container {
                background-color: rgba(255, 255, 255, 0.7);
                padding: 10px;
                margin-top: 5px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* Ajustar el difuminado */
            }
            .border-bottom {
                border-bottom: 1px solid #000;
                padding-bottom: 0px;
                margin-top: 2px;
            }
        </style>