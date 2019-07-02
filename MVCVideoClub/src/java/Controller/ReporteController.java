/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import Mapper.ReporteMapper;
import Models.Reporte;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
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
     mav.addObject("datos",null);
     mav.setViewName("reporte/prueba");
     return mav;
    }
    @RequestMapping(value="/reporte/prueba.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(String anio ){
        if (!anio.equals("")) {
            String sql="SELECT COUNT(*) as contador, MONTHNAME(ALQ_FECHA_DESDE) as mes "
             + "FROM alquiler WHERE YEAR(ALQ_FECHA_DESDE)=" + anio
             + " GROUP BY MONTH(ALQ_FECHA_DESDE) "
             + "ORDER BY MONTH(ALQ_FECHA_DESDE) ASC";
        List <Reporte> datos = this.jdbcTemplate.query(sql,new ReporteMapper());
        String[] meses = new String[datos.size()];
        double[] alquiler = new double[datos.size()];
            for (int i = 0; i < datos.size(); i++) {
                meses[i] = "'"+datos.get(i).getMes()+"'";
                alquiler[i] = datos.get(i).getAlquiler();
            }
            mav.addObject("datos", datos.toString());
            mav.addObject("meses", Arrays.toString(meses));
            
            mav.addObject("alquiler", Arrays.toString(alquiler));
        }else
           mav.addObject("datos",null);
     
     mav.setViewName("reporte/prueba");
     return mav;
    }
}
