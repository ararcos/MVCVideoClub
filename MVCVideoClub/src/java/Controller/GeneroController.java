/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import Models.Genero;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author diego
 */
@Controller
public class GeneroController {
     Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    @RequestMapping("/genero/index.htm")
    public ModelAndView Listar(){
        String sql="select * from genero";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("genero/index");
     return mav;
    }
    @RequestMapping(value="/genero/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     mav.addObject(new Genero());
     mav.setViewName("genero/agregar");
     return mav;
    }
    @RequestMapping(value="/genero/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Genero genero){
        String sql="insert into genero  (GEN_NOMBRE) values(?)";
        this.jdbcTemplate.update(sql,genero.getNombre());
     return new ModelAndView("redirect:/genero/index.htm");
    }
    @RequestMapping(value="/genero/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List genero=Buscar();
     mav.addObject("genero",genero);
     mav.setViewName("genero/editar");
     return mav;
    }
    @RequestMapping(value="/genero/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Genero genero){
        String sql="update genero set GEN_NOMBRE=? WHERE GEN_ID=?";
        this.jdbcTemplate.update(sql,genero.getNombre(),id);
     return new ModelAndView("redirect:/genero/index.htm");
    }
    @RequestMapping(value="/genero/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List genero=Buscar();
     mav.addObject("genero",genero);
     mav.setViewName("genero/eliminar");
     return mav;
    }
    @RequestMapping(value="/genero/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Genero genero){
        String sql="Delete from genero WHERE GEN_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/genero/index.htm");
    }
    public List Buscar(){
        Genero genero = new Genero();
        String sql="select * from genero where GEN_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
}
