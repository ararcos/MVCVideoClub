/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import Models.Sexo;
import Models.Socio;
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
public class SocioController {
    Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav=new ModelAndView();
    int id;
    
    @RequestMapping("/socio/index.htm")
    public ModelAndView Listar(){
        String sql="select * from socio";
        List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("socio/index");
     return mav;
    }
    @RequestMapping(value = "/socio/agregar.htm", method = RequestMethod.GET)
    public ModelAndView Agregar(){
        mav.addObject(new Socio());
        mav.setViewName("socio/agregar");
        return mav;
    }
      @RequestMapping(value = "/socio/agregar.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Socio socio){
         String sql="insert into socio(SOC_CEDULA,SOC_NOMBRE,SOC_DIRECCION,SOC_TELEFONO,SOC_CORREO) values(?,?,?,?,?)";
        this.jdbcTemplate.update(sql,socio.getCedula(),socio.getNombre(),socio.getDireccion(),socio.getTelefono(),socio.getCorreo());
     return new ModelAndView("redirect:/socio/index.htm");
    }
    
    @RequestMapping(value="/socio/editar.htm", method = RequestMethod.GET )
    public ModelAndView Actualizar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List socio=Buscar();
     mav.addObject("socio",socio);
     mav.setViewName("socio/editar");
     return mav;
    }
    @RequestMapping(value="/socio/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Socio socio){
        String sql="update socio set SOC_CEDULA=?,SOC_NOMBRE=?,SOC_DIRECCION=?,SOC_TELEFONO=?,SOC_CORREO=? WHERE SOC_ID=?";
        this.jdbcTemplate.update(sql,socio.getCedula(),socio.getNombre(),socio.getDireccion(),socio.getTelefono(),socio.getCorreo(),id);
     return new ModelAndView("redirect:/socio/index.htm");
    }
    @RequestMapping(value="/socio/eliminar.htm", method = RequestMethod.GET )
    public ModelAndView Eliminar(HttpServletRequest request){
     id=Integer.parseInt(request.getParameter("id"));
     List socio=Buscar();
     mav.addObject("socio",socio);
     mav.setViewName("socio/eliminar");
     return mav;
    }
    @RequestMapping(value="/socio/eliminar.htm", method = RequestMethod.POST )
    public ModelAndView Eliminar(Socio socio){
        String sql="Delete from socio WHERE SOC_ID=?";
        this.jdbcTemplate.update(sql,id);
     return new ModelAndView("redirect:/socio/index.htm");
    }
    
      public List Buscar(){
        Socio socio = new Socio();
        String sql="select * from socio where SOC_ID="+id;
        List datos = this.jdbcTemplate.queryForList(sql);
        return datos;
    }
}
