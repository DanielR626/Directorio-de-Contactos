package com.mycompany.agendaweb.mundo;

import java.util.ArrayList;
import java.util.List;

public class ArbolContactos {

    private Nodo raiz;

    public ArbolContactos() {
        this.raiz = null;
    }

    // Método para agregar un contacto
    public void agregarContacto(Contacto contacto) {
        raiz = agregarRecursivo(raiz, contacto);
    }

    private Nodo agregarRecursivo(Nodo actual, Contacto contacto) {
        if (actual == null) {
            return new Nodo(contacto);
        }
        // Ordenamiento basado en el nombre
        if (contacto.getNombres().compareTo(actual.getContacto().getNombres()) < 0) {
            actual.setHijoIzquierdo(agregarRecursivo(actual.getHijoIzquierdo(), contacto));
        } else if (contacto.getNombres().compareTo(actual.getContacto().getNombres()) > 0) {
            actual.setHijoDerecho(agregarRecursivo(actual.getHijoDerecho(), contacto));
        } else {
            // El contacto ya existe
            return actual;
        }
        return actual;
    }

    // Método para buscar un contacto por nombre
    public Contacto buscarContacto(String nombre) {
        return buscarRecursivo(raiz, nombre);
    }

    private Contacto buscarRecursivo(Nodo actual, String nombre) {
        if (actual == null) {
            return null; // No encontrado
        }
        if (nombre.equals(actual.getContacto().getNombres())) {
            return actual.getContacto();
        }
        return nombre.compareTo(actual.getContacto().getNombres()) < 0
                ? buscarRecursivo(actual.getHijoIzquierdo(), nombre)
                : buscarRecursivo(actual.getHijoDerecho(), nombre);
    }

    // Método para editar un contacto por nombre
    // Este método asume que quieres reemplazar el contacto existente con uno nuevo que tiene el mismo nombre
    public void editarContacto(Contacto contactoEditar) {
        eliminarContacto(contactoEditar.getNombres()); // Eliminamos el contacto existente
        agregarContacto(contactoEditar); // Agregamos el nuevo contacto
    }

    // Método para eliminar un contacto por nombre
    public void eliminarContacto(String nombre) {
        raiz = eliminarRecursivo(raiz, nombre);
    }

    private Nodo eliminarRecursivo(Nodo actual, String nombre) {
        if (actual == null) {
            return null;
        }

        if (nombre.equals(actual.getContacto().getNombres())) {
            // Nodo a eliminar encontrado
            if (actual.getHijoIzquierdo() == null && actual.getHijoDerecho() == null) {
                return null; // Caso 1: sin hijos
            }
            if (actual.getHijoDerecho() == null) {
                return actual.getHijoIzquierdo(); // Caso 2: solo hijo izquierdo
            }
            if (actual.getHijoIzquierdo() == null) {
                return actual.getHijoDerecho(); // Caso 2: solo hijo derecho
            }
            // Caso 3: dos hijos
            Contacto contactoSucesor = encontrarSucesor(actual.getHijoDerecho());
            actual.setContacto(contactoSucesor);
            actual.setHijoDerecho(eliminarRecursivo(actual.getHijoDerecho(), contactoSucesor.getNombres()));
            return actual;
        }
        if (nombre.compareTo(actual.getContacto().getNombres()) < 0) {
            actual.setHijoIzquierdo(eliminarRecursivo(actual.getHijoIzquierdo(), nombre));
        } else {
            actual.setHijoDerecho(eliminarRecursivo(actual.getHijoDerecho(), nombre));
        }
        return actual;
    }

    // Método auxiliar para encontrar el sucesor (el menor de los mayores)
    private Contacto encontrarSucesor(Nodo raiz) {
        while (raiz.getHijoIzquierdo() != null) {
            raiz = raiz.getHijoIzquierdo();
        }
        return raiz.getContacto();
    }

    // Método toList para convertir el árbol en una lista
    public List<Contacto> toList() {
        List<Contacto> lista = new ArrayList<>();
        toListRecursivo(raiz, lista);
        return lista;
    }

    // Método auxiliar recursivo para realizar el recorrido en orden
    private void toListRecursivo(Nodo nodo, List<Contacto> lista) {
        if (nodo != null) {
            toListRecursivo(nodo.getHijoIzquierdo(), lista); // Visita el hijo izquierdo
            lista.add(nodo.getContacto()); // Visita el nodo actual
            toListRecursivo(nodo.getHijoDerecho(), lista); // Visita el hijo derecho
        }
    }

}
