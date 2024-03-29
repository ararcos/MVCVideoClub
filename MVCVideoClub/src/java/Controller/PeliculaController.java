/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import Mapper.peliculaMapper;
import Models.ActorPelicula;
import Models.Director;
import Models.Formato;
import Models.Genero;
import Models.Pelicula;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author alexa
 */
@Controller
public class PeliculaController {
    Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    Pelicula peli=new Pelicula();
    String ruta;
    int id;
    int idReparto;
    @RequestMapping("/pelicula/index.htm")
    public ModelAndView Listar(){
    String sql="SELECT p.*,g.GEN_NOMBRE,d.DIR_NOMBRE,f.FOR_NOMBRE FROM pelicula p, "
                + "genero g,formato f,director d WHERE p.GEN_ID=g.GEN_ID "
                + "and p.DIR_ID=d.DIR_ID and p.FOR_ID=f.FOR_ID ";
     List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("pelicula/index");
     return mav;
    }
    @RequestMapping(value="/pelicula/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     String sql="SELECT * FROM genero ";
     List genero = this.jdbcTemplate.queryForList(sql);
     String sql1="SELECT * FROM formato ";
     List formato = this.jdbcTemplate.queryForList(sql1);
     String sql2="SELECT * FROM director ";
     List director = this.jdbcTemplate.queryForList(sql2);
     mav.addObject(new Pelicula());
     mav.addObject("genero",genero);
     mav.addObject("formato",formato);
     mav.addObject("director",director);

     mav.setViewName("pelicula/agregar");
     return mav;
    }
    @RequestMapping(value="/pelicula/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Pelicula pelicula){
        String sql="insert into pelicula(PEL_NOMBRE,GEN_ID,DIR_ID,FOR_ID,PEL_COSTO,PEL_FECHA_ESTRENO) values(?,?,?,?,?,?)";
        
        this.jdbcTemplate.update(sql,pelicula.getNombre(),pelicula.getGenId(),pelicula.getDirId(),pelicula.getForId(),pelicula.getCosto(),pelicula.getFecha());
     return new ModelAndView("redirect:/pelicula/index.htm");
    }
     @RequestMapping(value="/pelicula/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List pelicula=Buscar();
     String sql="SELECT * FROM genero ";
     List genero = this.jdbcTemplate.queryForList(sql);
     String sql1="SELECT * FROM formato ";
     List formato = this.jdbcTemplate.queryForList(sql1);
     String sql2="SELECT * FROM director ";
     List director = this.jdbcTemplate.queryForList(sql2);
     mav.addObject("genero",genero);
     mav.addObject("formato",formato);
     mav.addObject("director",director);
     mav.addObject("peli",pelicula);
     mav.setViewName("pelicula/editar");
     return mav;
    }
    @RequestMapping(value="/pelicula/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Pelicula pelicula){
        
        String sql="update pelicula set PEL_NOMBRE=?,GEN_ID=?,DIR_ID=?,FOR_ID=?,PEL_COSTO=?,PEL_FECHA_ESTRENO=? WHERE PEL_ID=?";
        this.jdbcTemplate.update(sql,pelicula.getNombre(),pelicula.getGenId(),pelicula.getDirId(),pelicula.getForId(),pelicula.getCosto(),pelicula.getFecha(),id);
        
     return new ModelAndView("redirect:/pelicula/index.htm");
    }
    @RequestMapping(value="/pelicula/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List pelicula=Buscar();
     mav.addObject("pelicula",pelicula);
     mav.setViewName("pelicula/eliminar");
     return mav;
    }
    @RequestMapping(value="/pelicula/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Pelicula pelicula){
        String sql="Delete from pelicula WHERE PEL_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/pelicula/index.htm");
    }
    public List Buscar(){
        Pelicula pelicula = new Pelicula();
        String sql="SELECT p.*,g.GEN_NOMBRE,d.DIR_NOMBRE,f.FOR_NOMBRE FROM pelicula p, "
                + "genero g,formato f,director d WHERE p.PEL_ID="+id+" and p.GEN_ID=g.GEN_ID "
                + "and p.DIR_ID=d.DIR_ID and p.FOR_ID=f.FOR_ID ";
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
    @RequestMapping(value="/pelicula/agregarFormato.htm", method = RequestMethod.GET )
    public ModelAndView AgregarFormato(HttpServletRequest request){
     ruta=request.getParameter("ruta");
     mav.addObject(new Formato());
     mav.setViewName("formato/agregar");
     return mav;
    }
    @RequestMapping(value="/pelicula/agregarFormato.htm", method = RequestMethod.POST )
    public ModelAndView AgregarFormato(Formato formato){
        String sql="insert into formato(FOR_NOMBRE) values(?)";
        
        this.jdbcTemplate.update(sql,formato.getNombre());
     return new ModelAndView("redirect:"+ruta);
    }
    @RequestMapping(value="/pelicula/agregarDirector.htm", method = RequestMethod.GET )
    public ModelAndView AgregarDirector(HttpServletRequest request){
     ruta=request.getParameter("ruta");
     mav.addObject(new Director());
     mav.setViewName("director/agregar");
     return mav;
    }
    @RequestMapping(value="/pelicula/agregarDirector.htm", method = RequestMethod.POST )
    public ModelAndView AgregarDirector(Director director){
        String sql="insert into director(DIR_NOMBRE) values(?)";
        
        this.jdbcTemplate.update(sql,director.getNombre());
     return new ModelAndView("redirect:"+ruta);
    }
    @RequestMapping(value="/pelicula/agregarGenero.htm", method = RequestMethod.GET )
    public ModelAndView AgregarGenero(HttpServletRequest request){
     ruta=request.getParameter("ruta");
     mav.addObject(new Genero());
     mav.setViewName("genero/agregar");
     return mav;
    }
    @RequestMapping(value="/pelicula/agregarGenero.htm", method = RequestMethod.POST )
    public ModelAndView AgregarGenero(Genero genero){
        String sql="insert into genero(GEN_NOMBRE) values(?)";
        
        this.jdbcTemplate.update(sql,genero.getNombre());
     return new ModelAndView("redirect:"+ruta);
    }
    @RequestMapping(value="/pelicula/reparto.htm", method = RequestMethod.GET )
    public ModelAndView Reparto(HttpServletRequest request){
        id=Integer.parseInt(request.getParameter("id"));
        String sql="SELECT * FROM pelicula WHERE PEL_ID="+id;
        String sql2="SELECT ap.*,a.ACT_NOMBRE FROM actor_pelicula ap, actor a WHERE ap.ACT_ID=a.ACT_ID AND ap.PEL_ID ="+id;
        String sql3="SELECT * FROM actor ";
        peli = this.jdbcTemplate.queryForObject(sql,new peliculaMapper());
        List datos = this.jdbcTemplate.queryForList(sql2);
        List listActores = this.jdbcTemplate.queryForList(sql3);
        mav.addObject("listActor",listActores);
        ActorPelicula actor=new ActorPelicula();
        actor.setPelicula(peli);
        mav.addObject("actor",actor);
        mav.addObject("actores",datos);
        mav.setViewName("pelicula/reparto");
     return mav;
    }
    @RequestMapping(value="/pelicula/reparto.htm", method = RequestMethod.POST )
    public ModelAndView Reparto(ActorPelicula actorPelicula){
        ActorPelicula actor = new ActorPelicula();
        actor.setPelicula(peli);
        String sql="insert into actor_pelicula(APL_PAPEL,PEL_ID,ACT_ID) values(?,?,?)";
        this.jdbcTemplate.update(sql,actorPelicula.getPapel(),peli.getId(),actorPelicula.getActId());
        String sql2="SELECT ap.*,a.ACT_NOMBRE FROM actor_pelicula ap, actor a WHERE ap.ACT_ID=a.ACT_ID AND ap.PEL_ID ="+id;
        String sql3="SELECT * FROM actor ";
        List datos = this.jdbcTemplate.queryForList(sql2);
        List listActores = this.jdbcTemplate.queryForList(sql3);
        actor.setPelicula(actorPelicula.getPelicula());
        mav.addObject("listActor",listActores);
        mav.addObject("actor",actor);
        mav.addObject("actores",datos);
        mav.setViewName("pelicula/reparto");
     return mav;
    }
    @RequestMapping(value="/pelicula/eliminarReparto.htm", method = RequestMethod.GET )
    public ModelAndView EliminarReparto(HttpServletRequest request){
     idReparto=Integer.parseInt(request.getParameter("id"));
     String sql="SELECT ap.*,a.ACT_NOMBRE,p.PEL_NOMBRE FROM actor_pelicula ap, actor a, pelicula p WHERE ap.ACT_ID=a.ACT_ID AND ap.PEL_ID = p.PEL_ID AND APL_ID="+idReparto;
        System.out.println(sql);
     List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("actorPelicula",datos);
     mav.setViewName("actorPelicula/eliminar");
     return mav;
    }
    @RequestMapping(value="/pelicula/eliminarReparto.htm", method = RequestMethod.POST )
    public ModelAndView EliminarReparto(ActorPelicula actorPelicula){
        String sql="Delete from actor_pelicula WHERE APL_ID=?";
        this.jdbcTemplate.update(sql,idReparto);
     return new ModelAndView("redirect:/pelicula/reparto.htm?id="+id);
    }
    @RequestMapping(value="/pelicula/editarReparto.htm", method = RequestMethod.GET )
    public ModelAndView EditarReparto(HttpServletRequest request){
     String sql="SELECT * FROM actor ";
     List actor = this.jdbcTemplate.queryForList(sql);
     mav.addObject("actor",actor);
     String sql1="SELECT * FROM pelicula ";
     List pelicula = this.jdbcTemplate.queryForList(sql1);
     mav.addObject("pelicula",pelicula);
     idReparto=Integer.parseInt(request.getParameter("id"));
     String sql2="SELECT ap.*,a.ACT_NOMBRE,p.PEL_NOMBRE FROM actor_pelicula ap, actor a, pelicula p WHERE ap.ACT_ID=a.ACT_ID AND ap.PEL_ID = p.PEL_ID AND APL_ID="+idReparto;
     List actorPelicula = this.jdbcTemplate.queryForList(sql2);
     mav.addObject("actorPelicula",actorPelicula);
     mav.setViewName("actorPelicula/editar");
     return mav;
    }
    @RequestMapping(value="/pelicula/editarReparto.htm", method = RequestMethod.POST )
    public ModelAndView EditarReparto(ActorPelicula actorPelicula){
        String sql="update actor_pelicula set APL_PAPEL=?,PEL_ID=?,ACT_ID=? WHERE APL_ID=?";
        this.jdbcTemplate.update(sql,actorPelicula.getPapel(),actorPelicula.getPelId(),actorPelicula.getActId(),idReparto);
      return new ModelAndView("redirect:/pelicula/reparto.htm?id="+id);
    }
}
