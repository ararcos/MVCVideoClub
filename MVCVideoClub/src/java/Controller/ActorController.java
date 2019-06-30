
package Controller;

import Config.Conexion;
import Models.Actor;
import Models.Sexo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ActorController {
    Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    @RequestMapping("/actor/index.htm")
    public ModelAndView Listar(){
        String sql="SELECT a.*,s.SEX_NOMBRE FROM actor a, sexo s WHERE a.SEX_ID=s.SEX_ID";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("actor/index");
     return mav;
    }
    @RequestMapping(value="/actor/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     String sql="SELECT * FROM sexo ";
     List sexo = this.jdbcTemplate.queryForList(sql);
     mav.addObject("sexo",sexo);
     mav.addObject(new Actor());
     mav.setViewName("actor/agregar");
     return mav;
    }
    @RequestMapping(value="/actor/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Actor actor){
        String sql="insert into actor(ACT_NOMBRE,SEX_ID) values(?,?)";
        this.jdbcTemplate.update(sql,actor.getNombre(),actor.getSexId());
     return new ModelAndView("redirect:/actor/index.htm");
    }
    @RequestMapping(value="/actor/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List actor=Buscar();
     String sql="SELECT * FROM sexo ";
     List sexo = this.jdbcTemplate.queryForList(sql);
     mav.addObject("sexo",sexo);
     mav.addObject("actor",actor);
     mav.setViewName("actor/editar");
     return mav;
    }
    @RequestMapping(value="/actor/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Actor actor){
        String sql="update actor set ACT_NOMBRE=?,SEX_ID=? WHERE ACT_ID=?";
        this.jdbcTemplate.update(sql,actor.getNombre(),actor.getSexId(),id);
     return new ModelAndView("redirect:/actor/index.htm");
    }
    @RequestMapping(value="/actor/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List actor=Buscar();
     mav.addObject("actor",actor);
     mav.setViewName("actor/eliminar");
     return mav;
    }
    @RequestMapping(value="/actor/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Actor actor){
        String sql="Delete from actor WHERE ACT_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/actor/index.htm");
    }
    public List Buscar(){
        Actor actor = new Actor();
        String sql="select a.*,s.SEX_NOMBRE from actor a,sexo s where a.SEX_ID=s.SEX_ID AND a.ACT_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
}
