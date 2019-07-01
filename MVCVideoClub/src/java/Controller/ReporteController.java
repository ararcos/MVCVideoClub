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
public class ReporteController {
    ModelAndView mav=new ModelAndView();
    Conexion con= new Conexion();
    
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    
    @RequestMapping(value="/reporte/prueba.htm", method = RequestMethod.GET )
    public ModelAndView Prueba(){
     String sql="SELECT COUNT(*) as contador, MONTH(ALQ_FECHA_DESDE) as mes "
             + "FROM alquiler WHERE YEAR(ALQ_FECHA_DESDE)= 2019 GROUP BY MONTH(ALQ_FECHA_DESDE) "
             + "ORDER BY MONTH(ALQ_FECHA_DESDE) ASC";
     List datos = this.jdbcTemplate.queryForList(sql);
     mav.addObject("lista",datos);
     mav.setViewName("reporte/prueba");
     return mav;
    }
}
