<%@page import="com.mycompany.agendaweb.mundo.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Contacto</title>
    </head>
    <body>
        <div class="container mt-5">
            <h1>Editar Contacto</h1>
            <%
                Contacto contacto = (Contacto) request.getAttribute("contactoParaEditar");
                if (contacto == null) {
                    // Solo para evitar null pointer en el JSP, manejar adecuadamente en producción
                    contacto = new Contacto();
                }
            %>
            <form action="SvAgenda" method="POST" class="mt-3">
                <input type="hidden" name="accion" value="editar">
                <input type="hidden" name="nombresOriginal" value="<%= contacto.getNombres()%>"> <!-- Importante para identificar el contacto en caso de cambio de nombre -->

                <div class="mb-3">
                    <label for="nombres" class="form-label">Nombres:</label>
                    <input type="text" class="form-control" id="nombres" name="nombres" value="<%= contacto.getNombres()%>">
                </div>

                <div class="mb-3">
                    <label for="apellidos" class="form-label">Apellidos:</label>
                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%= contacto.getApellidos()%>">
                </div>

                <div class="mb-3">
                    <label for="correo" class="form-label">Correo electrónico:</label>
                    <input type="text" class="form-control" id="correo" name="correo" value="<%= contacto.getCorreo()%>">
                </div>

                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" value="<%= contacto.getDireccion()%>">
                </div>

                <div class="mb-3">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="text" class="form-control" id="telefono" name="telefono" value="<%= contacto.getCelular()%>">
                </div>

                <button type="submit" class="btn btn-primary">Actualizar</button>
                <a href="SvAgenda?accion=mostrarContactos" class="btn btn-secondary">Volver</a>
            </form>
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
                padding: 20px;
                margin-top: 50px;
            }
            .border-bottom {
                border-bottom: 1px solid #000;
                padding-bottom: 10px;
                margin-top: 20px;
            }
        </style>