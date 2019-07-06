/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alexa
 */
public class Alquiler {
    private int id;
    private int socId=0;
    private int pelId=0;
    private String fechaDesde;
    private String fechaHasta;
    private double valor;
    private String fechaEntrega;
    private Socio socio=new Socio();
    private Pelicula pelicula = new Pelicula();
    private List<Pelicula> lislPeliculas = new ArrayList<Pelicula>();

    public List<Pelicula> getLislPeliculas() {
        return lislPeliculas;
    }

    public void setLislPeliculas(List<Pelicula> lislPeliculas) {
        this.lislPeliculas = lislPeliculas;
    }
    
    public Pelicula getPelicula() {
        return pelicula;
    }

    public void setPelicula(Pelicula pelicula) {
        this.pelicula = pelicula;
    }
    
    public Socio getSocio() {
        return socio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public void setSocio(Socio socio) {
        this.socio = socio;
    }
     
    public Alquiler() {
    }

    public int getSocId() {
        return socId;
    }

    public void setSocId(int socId) {
        this.socId = socId;
    }

    public int getPelId() {
        return pelId;
    }

    public void setPelId(int pelId) {
        this.pelId = pelId;
    }

    public String getFechaDesde() {
        return fechaDesde;
    }

    public void setFechaDesde(String fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public String getFechaHasta() {
        return fechaHasta;
    }

    public void setFechaHasta(String fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }
    
    
}
