/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;



/**
 *
 * @author alexa
 */
public class Pelicula {
    int id;
    int genId;
    int forId;
    int dirId;
    String nombre;
    double costo;
    String fecha;
    Genero genero =new Genero();
    Formato formato = new Formato();
    Director director = new Director();
    
    public Pelicula() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Formato getFormato() {
        return formato;
    }

    public void setFormato(Formato formato) {
        this.formato = formato;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getGenId() {
        return genId;
    }

    public void setGenId(int genId) {
        this.genId = genId;
    }

    public int getForId() {
        return forId;
    }

    public void setForId(int forId) {
        this.forId = forId;
    }

    public int getDirId() {
        return dirId;
    }

    public void setDirId(int dirId) {
        this.dirId = dirId;
    }
    
    
}
