/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;

import Models.Formato;
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
public class FormatoController {
    Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    @RequestMapping("/formato/index.htm")
    public ModelAndView Listar(){
        String sql="select * from formato";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("formato/index");
     return mav;
    }
    @RequestMapping(value="/formato/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     mav.addObject(new Formato());
     mav.setViewName("formato/agregar");
     return mav;
    }
    @RequestMapping(value="/formato/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Formato formato){
        String sql="insert into formato(FOR_NOMBRE) values(?)";
        this.jdbcTemplate.update(sql,formato.getNombre());
     return new ModelAndView("redirect:/formato/index.htm");
    }
    @RequestMapping(value="/formato/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List formato=Buscar();
     mav.addObject("formato",formato);
     mav.setViewName("formato/editar");
     return mav;
    }
    @RequestMapping(value="/formato/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Formato formato){
        String sql="update formato set FOR_NOMBRE=? WHERE FOR_ID=?";
        this.jdbcTemplate.update(sql,formato.getNombre(),id);
     return new ModelAndView("redirect:/formato/index.htm");
    }
    @RequestMapping(value="/formato/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List formato=Buscar();
     mav.addObject("formato",formato);
     mav.setViewName("formato/eliminar");
     return mav;
    }
    @RequestMapping(value="/formato/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Formato formato){
        String sql="Delete from formato WHERE FOR_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/formato/index.htm");
    }
    public List Buscar(){
        Formato formato = new Formato();
        String sql="select * from formato where FOR_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
}
