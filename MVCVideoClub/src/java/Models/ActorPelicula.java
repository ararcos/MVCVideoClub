/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author diego
 */
public class ActorPelicula {
    private String papel;
    private int actId;
    private int pelId;
    private Pelicula pelicula=new Pelicula();
    private Actor actor= new Actor();
    private int id;
    
    public ActorPelicula() {
    }

    public int getActId() {
        return actId;
    }

    public void setActId(int actId) {
        this.actId = actId;
    }

    public int getPelId() {
        return pelId;
    }

    public void setPelId(int pelId) {
        this.pelId = pelId;
    }

    public Pelicula getPelicula() {
        return pelicula;
    }

    public void setPelicula(Pelicula pelicula) {
        this.pelicula = pelicula;
    }

    public Actor getActor() {
        return actor;
    }

    public void setActor(Actor actor) {
        this.actor = actor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    public ActorPelicula(String papel) {
        this.papel = papel;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }
    
}
