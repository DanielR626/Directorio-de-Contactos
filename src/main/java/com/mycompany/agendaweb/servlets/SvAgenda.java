package com.mycompany.agendaweb.servlets;

import com.mycompany.agendaweb.mundo.ArbolContactos;
import com.mycompany.agendaweb.mundo.Contacto;
import com.mycompany.agendaweb.mundo.GestorPersistencia;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvAgenda", urlPatterns = {"/SvAgenda"})
public class SvAgenda extends HttpServlet {

    private ArbolContactos arbolContactos;

    @Override
    public void init() throws ServletException {
        super.init();
        // Cargar el árbol de contactos al iniciar el servlet
        arbolContactos = GestorPersistencia.cargarArbol();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Aquí manejamos la acción de mostrar contactos después de agregar o directamente desde el enlace
        String accion = request.getParameter("accion");

        if (null != accion) {
            switch (accion) {
                case "eliminar" -> {
                    String nombres = request.getParameter("nombres");
                    // Aquí implementas la lógica para eliminar el contacto por nombres
                    arbolContactos.eliminarContacto(nombres);
                    GestorPersistencia.guardarArbol(arbolContactos); // Guardar el estado actualizado del árbol
                    response.sendRedirect("SvAgenda?accion=mostrarContactos");
                }
                case "editar" -> {
                    String nombres = request.getParameter("nombres");
                    Contacto contactoParaEditar = arbolContactos.buscarContacto(nombres);
                    if (contactoParaEditar != null) {
                        request.setAttribute("contactoParaEditar", contactoParaEditar);
                        request.getRequestDispatcher("editarContacto.jsp").forward(request, response);
                    } else {
                        // Manejar el caso de no encontrar el contacto
                        response.sendRedirect("SvAgenda?accion=mostrarContactos");
                    }
                }
                case "buscar" -> {
                    String nombreBusqueda = request.getParameter("nombreBusqueda");
                    Contacto contactoBuscado = arbolContactos.buscarContacto(nombreBusqueda);
                    List<Contacto> resultadoBusqueda = new ArrayList<>();
                    if (contactoBuscado != null) {
                        resultadoBusqueda.add(contactoBuscado); // Añade el contacto encontrado a la lista de resultados
                    }
                    request.setAttribute("listaContactos", resultadoBusqueda); // Establece la lista de resultados como un atributo de solicitud
                    request.getRequestDispatcher("mostrarContactos.jsp").forward(request, response); // Reenvía al JSP para mostrar los resultados
                }

                case "visualizar" -> {
                    String nombres = request.getParameter("nombres");
                    Contacto contactoParaVisualizar = arbolContactos.buscarContacto(nombres);
                    if (contactoParaVisualizar != null) {
                        request.setAttribute("contactoParaVisualizar", contactoParaVisualizar);
                        request.getRequestDispatcher("visualizarContacto.jsp").forward(request, response);
                    } else {
                        // Manejar el caso de no encontrar el contacto
                        response.sendRedirect("SvAgenda?accion=mostrarContactos");
                    }
                }
                case "mostrarContactos" -> {
                    request.setAttribute("listaContactos", arbolContactos.toList());
                    request.getRequestDispatcher("mostrarContactos.jsp").forward(request, response);
                }
                default -> {
                    response.sendRedirect("SvAgenda?accion=mostrarContactos");

                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion == null || "agregar".equals(accion)) {
            // Agregar un nuevo contacto
            agregarContacto(request);
        } else if ("editar".equals(accion)) {
            // Editar un contacto existente
            editarContacto(request);
        }
        // Siempre redirige a mostrar los contactos después de la operación
        response.sendRedirect("SvAgenda?accion=mostrarContactos");
    }

    private void agregarContacto(HttpServletRequest request) {
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        Contacto nuevoContacto = new Contacto(nombres, apellidos, correo, direccion, telefono);
        arbolContactos.agregarContacto(nuevoContacto);
        GestorPersistencia.guardarArbol(arbolContactos);
    }

    private void editarContacto(HttpServletRequest request) {
        // Recupera la información original y nueva del contacto desde el request
        String nombresOriginal = request.getParameter("nombres");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        // Busca y elimina el contacto original basado en su nombre original
        arbolContactos.eliminarContacto(nombresOriginal);

        // Crea y agrega el contacto editado como uno nuevo al árbol
        Contacto contactoEditado = new Contacto(nombres, apellidos, correo, direccion, telefono);
        arbolContactos.agregarContacto(contactoEditado);

        // Guarda el árbol de contactos actualizado en el archivo
        GestorPersistencia.guardarArbol(arbolContactos);
    }

    @Override
    public String getServletInfo() {
        return "Servlet SvAgenda maneja la agenda de contactos utilizando un árbol binario.";
    }
}
