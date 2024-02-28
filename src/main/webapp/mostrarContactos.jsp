<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.agendaweb.mundo.Contacto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Contactos</title>
    
        
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    
    
    <body>

        <div class="container mt-5">
            <h1>Buscar en la lista de contactos registrados</h1>
            <div class="row">
                <div class="col">
                    <form action="SvAgenda" method="GET" class="form-inline mb-3 d-flex justify-content-between">
                        <input type="hidden" name="accion" value="buscar">
                        <div class="flex-grow-1 mr-2">
                            <input type="text" id="nombreBusqueda" name="nombreBusqueda" class="form-control w-100" placeholder="Nombre del contacto">
                        </div>
                        <button type="submit" class="btn btn-primary">Buscar</button>
                    </form>
                </div>
                <div class="col-auto">
                    <form action="SvAgenda" method="GET">
                        <input type="hidden" name="accion" value="mostrarContactos">
                        <button type="submit" class="btn btn-secondary">Refrescar</button>
                    </form>
                </div>
            </div>
            <a href="/agendaWeb/" class="btn btn-info">Volver</a>

            <h2 class="mt-4">Lista de contactos registrados</h2>
            <%
                List<Contacto> listaContactos = (List<Contacto>) request.getAttribute("listaContactos");
                int contador = 1;
                for (Contacto contacto : listaContactos) {
            %>
            <div class="border-bottom pb-2 mt-2">
                <h5>Contacto N° <%= contador%></h5>
                <p>Nombres: <%= contacto.getNombres()%></p>
                <p>Apellidos: <%= contacto.getApellidos()%></p>
                <p>Correo: <%= contacto.getCorreo()%></p>
                <p>Dirección: <%= contacto.getDireccion()%></p>
                <p>Teléfono: <%= contacto.getCelular()%></p>
                <a href="SvAgenda?accion=visualizar&nombres=<%= URLEncoder.encode(contacto.getNombres(), "UTF-8")%>" class="btn btn-sm btn-primary">Visualizar</a>
                <a href="SvAgenda?accion=editar&nombres=<%= URLEncoder.encode(contacto.getNombres(), "UTF-8")%>" class="btn btn-sm btn-warning">Editar</a>
                <a href="SvAgenda?accion=eliminar&nombres=<%= contacto.getNombres()%>" class="btn btn-sm btn-danger">Eliminar</a>
            </div>
            <% contador++; %>
            <% }%>
        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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