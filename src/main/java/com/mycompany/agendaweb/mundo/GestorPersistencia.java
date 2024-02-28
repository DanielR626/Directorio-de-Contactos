package com.mycompany.agendaweb.mundo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class GestorPersistencia {

    private static final String RUTA_ARCHIVO = "contactos.dat";

    // Guardar el árbol de contactos en un archivo
    public static void guardarArbol(ArbolContactos arbol) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(RUTA_ARCHIVO))) {
            oos.writeObject(arbol);
        } catch (IOException e) {
        }
    }

    // Cargar el árbol de contactos desde un archivo
    public static ArbolContactos cargarArbol() {
        File archivo = new File(RUTA_ARCHIVO);
        if (archivo.exists()) {
            try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(archivo))) {
                return (ArbolContactos) ois.readObject();
            } catch (IOException | ClassNotFoundException e) {
            }
        }
        return new ArbolContactos(); // Si no existe el archivo, retorna un árbol nuevo
    }
}