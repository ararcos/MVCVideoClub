
package Controller;

import Config.Conexion;
import Models.Actor;
import Models.ActorPelicula;
import Models.Pelicula;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActorPeliculaController {
 Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    ActorPelicula actorPelicula = new ActorPelicula();
    String ruta;
    @RequestMapping("/actorPelicula/index.htm")
    public ModelAndView Listar(){
        String sql="SELECT ap.*,a.ACT_NOMBRE,p.PEL_NOMBRE FROM actor_pelicula ap, actor a, pelicula p WHERE ap.ACT_ID=a.ACT_ID AND ap.PEL_ID = p.PEL_ID";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("actorPelicula/index");
     return mav;
    }
    @RequestMapping(value="/actorPelicula/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     String sql="SELECT * FROM actor ";
     List actor = this.jdbcTemplate.queryForList(sql);
     mav.addObject("actor",actor);
     String sql1="SELECT * FROM pelicula ";
     List pelicula = this.jdbcTemplate.queryForList(sql1);
     mav.addObject("pelicula",pelicula);
     mav.addObject(actorPelicula);
     mav.setViewName("actorPelicula/agregar");
     return mav;
    }
    @RequestMapping(value="/actorPelicula/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(ActorPelicula actorPelicula){
        String sql="insert into actor_pelicula(APL_PAPEL,PEL_ID,ACT_ID) values(?,?,?)";
        this.jdbcTemplate.update(sql,actorPelicula.getPapel(),actorPelicula.getPelId(),actorPelicula.getActId());
     return new ModelAndView("redirect:/actorPelicula/index.htm");
    }
    @RequestMapping(value="/actorPelicula/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     String sql="SELECT * FROM actor ";
     List actor = this.jdbcTemplate.queryForList(sql);
     mav.addObject("actor",actor);
     String sql1="SELECT * FROM pelicula ";
     List pelicula = this.jdbcTemplate.queryForList(sql1);
     mav.addObject("pelicula",pelicula);
     id=Integer.parseInt(request.getParameter("id"));
     List actorPelicula=Buscar();
     mav.addObject("actorPelicula",actorPelicula);
     mav.setViewName("actorPelicula/editar");
     return mav;
    }
    @RequestMapping(value="/actorPelicula/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(ActorPelicula actorPelicula){
        String sql="update actor_pelicula set APL_PAPEL=?,PEL_ID=?,ACT_ID=? WHERE APL_ID=?";
        this.jdbcTemplate.update(sql,actorPelicula.getPapel(),actorPelicula.getPelId(),actorPelicula.getActId(),id);
     return new ModelAndView("redirect:/actorPelicula/index.htm");
    }
    @RequestMapping(value="/actorPelicula/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List actorPelicula=Buscar();
     mav.addObject("actorPelicula",actorPelicula);
     mav.setViewName("actorPelicula/eliminar");
     return mav;
    }
    @RequestMapping(value="/actorPelicula/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(ActorPelicula actorPelicula){
        String sql="Delete from actor_pelicula WHERE APL_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/actorPelicula/index.htm");
    }
    public List Buscar(){
        ActorPelicula actorPelicula = new ActorPelicula();
        String sql="SELECT ap.*,a.ACT_NOMBRE,p.PEL_NOMBRE FROM actor_pelicula ap, actor a, pelicula p WHERE ap.ACT_ID=a.ACT_ID AND ap.PEL_ID = p.PEL_ID AND APL_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
     @RequestMapping(value="/actorPelicula/guardarActor.htm", method = RequestMethod.GET )
    public ModelAndView GuardarActor(HttpServletRequest request){
        ruta=request.getParameter("ruta");
     String sql="SELECT * FROM sexo ";
     List sexo = this.jdbcTemplate.queryForList(sql);
     mav.addObject("sexo",sexo);
     mav.addObject(new Actor());
     mav.setViewName("actor/agregar");
     return mav;
    }
    @RequestMapping(value="/actorPelicula/guardarActor.htm", method = RequestMethod.POST )
    public ModelAndView GuardarActor(Actor actor){
        String sql="insert into actor(ACT_NOMBRE,SEX_ID) values(?,?)";
        this.jdbcTemplate.update(sql,actor.getNombre(),actor.getSexId());
     return new ModelAndView("redirect:"+ruta);
    }
    @RequestMapping(value="/actorPelicula/guardarPelicula.htm", method = RequestMethod.GET )
    public ModelAndView GuardarPelicula(HttpServletRequest request){
         ruta=request.getParameter("ruta");
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
    @RequestMapping(value="/actorPelicula/guardarPelicula.htm", method = RequestMethod.POST )
    public ModelAndView GuardarPelicula(Pelicula pelicula){
      String sql="insert into pelicula(PEL_NOMBRE,GEN_ID,DIR_ID,FOR_ID,PEL_COSTO,PEL_FECHA_ESTRENO) values(?,?,?,?,?,?)";
        
        this.jdbcTemplate.update(sql,pelicula.getNombre(),pelicula.getGenId(),pelicula.getDirId(),pelicula.getForId(),pelicula.getCosto(),pelicula.getFecha());
     return new ModelAndView("redirect:"+ruta);
    }
}
