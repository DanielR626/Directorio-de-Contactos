package com.mycompany.agendaweb.mundo;

public class Nodo {
    private Contacto contacto;
    private Nodo hijoIzquierdo;
    private Nodo hijoDerecho;

    public Nodo(Contacto contacto) {
        this.contacto = contacto;
        this.hijoIzquierdo = null;
        this.hijoDerecho = null;
    }

    // Getters y Setters
    public Contacto getContacto() {
        return contacto;
    }

    public void setContacto(Contacto contacto) {
        this.contacto = contacto;
    }

    public Nodo getHijoIzquierdo() {
        return hijoIzquierdo;
    }

    public void setHijoIzquierdo(Nodo hijoIzquierdo) {
        this.hijoIzquierdo = hijoIzquierdo;
    }

    public Nodo getHijoDerecho() {
        return hijoDerecho;
    }

    public void setHijoDerecho(Nodo hijoDerecho) {
        this.hijoDerecho = hijoDerecho;
    }
}