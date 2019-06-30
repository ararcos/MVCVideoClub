/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;

import Models.Sexo;
import java.util.ArrayList;
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
public class SexoController {
    Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    @RequestMapping("/sexo/index.htm")
    public ModelAndView Listar(){
        String sql="select * from sexo";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("sexo/index");
     return mav;
    }
    @RequestMapping(value="/sexo/agregar.htm", method = RequestMethod.GET )
    public ModelAndView Agregar(){
     
     mav.addObject(new Sexo());
     mav.setViewName("sexo/agregar");
     return mav;
    }
    @RequestMapping(value="/sexo/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Sexo sexo){
        String sql="insert into sexo(SEX_NOMBRE) values(?)";
        this.jdbcTemplate.update(sql,sexo.getNombre());
     return new ModelAndView("redirect:/sexo/index.htm");
    }
    @RequestMapping(value="/sexo/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List sexo=Buscar();
     mav.addObject("sexo",sexo);
     mav.setViewName("sexo/editar");
     return mav;
    }
    @RequestMapping(value="/sexo/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Sexo sexo){
        String sql="update sexo set SEX_NOMBRE=? WHERE SEX_ID=?";
        this.jdbcTemplate.update(sql,sexo.getNombre(),id);
     return new ModelAndView("redirect:/sexo/index.htm");
    }
    @RequestMapping(value="/sexo/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List sexo=Buscar();
     mav.addObject("sexo",sexo);
     mav.setViewName("sexo/eliminar");
     return mav;
    }
    @RequestMapping(value="/sexo/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Sexo sexo){
        String sql="Delete from sexo WHERE SEX_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/sexo/index.htm");
    }
    public List Buscar(){
        Sexo sexo = new Sexo();
        String sql="select * from sexo where SEX_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
}
