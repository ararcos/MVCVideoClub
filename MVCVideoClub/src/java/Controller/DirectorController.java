package Controller;

import Config.Conexion;
import Models.Director;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DirectorController {
Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    @RequestMapping("/director/index.htm")
    public ModelAndView Listar(){
        String sql="select * from director";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("director/index");
     return mav;
    }
    @RequestMapping(value="/director/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     mav.addObject(new Director());
     mav.setViewName("director/agregar");
     return mav;
    }
    @RequestMapping(value="/director/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Director actorPelicula){
        String sql="insert into director(DIR_NOMBRE) values(?)";
        this.jdbcTemplate.update(sql,actorPelicula.getNombre());
     return new ModelAndView("redirect:/director/index.htm");
    }
    @RequestMapping(value="/director/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List director=Buscar();
     mav.addObject("director",director);
     mav.setViewName("director/editar");
     return mav;
    }
    @RequestMapping(value="/director/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Director director){
        String sql="update director set DIR_NOMBRE=? WHERE DIR_ID=?";
        this.jdbcTemplate.update(sql,director.getNombre(),id);
     return new ModelAndView("redirect:/director/index.htm");
    }
    @RequestMapping(value="/director/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List director=Buscar();
     mav.addObject("director",director);
     mav.setViewName("director/eliminar");
     return mav;
    }
    @RequestMapping(value="/director/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Director director){
        String sql="Delete from director WHERE DIR_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/director/index.htm");
    }
    public List Buscar(){
        Director director = new Director();
        String sql="select * from director where DIR_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
       
}
