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
    
    @RequestMapping(value="/reporte/alquilerMensual.htm", method = RequestMethod.GET )
    public ModelAndView AlquilerMensual(){
     mav.addObject("datos",null);
     mav.setViewName("reporte/prueba");
     return mav;
    }
    @RequestMapping(value="/reporte/alquilerMensual.htm", method = RequestMethod.POST )
    public ModelAndView AlquilerMensual(String anio ){
        if (!anio.equals("")) {
            String sql="SELECT COUNT(*) as valores, MONTHNAME(ALQ_FECHA_DESDE) as labels "
             + "FROM alquiler WHERE YEAR(ALQ_FECHA_DESDE)=" + anio
             + " GROUP BY MONTH(ALQ_FECHA_DESDE) "
             + "ORDER BY MONTH(ALQ_FECHA_DESDE) ASC";
        List <Reporte> datos = this.jdbcTemplate.query(sql,new ReporteMapper());
        String[] meses = new String[datos.size()];
        double[] alquiler = new double[datos.size()];
            for (int i = 0; i < datos.size(); i++) {
                meses[i] = "'"+datos.get(i).getLabels()+"'";
                alquiler[i] = datos.get(i).getValores();
            }
            mav.addObject("datos", datos.toString());
            mav.addObject("meses", Arrays.toString(meses));
            
            mav.addObject("alquiler", Arrays.toString(alquiler));
        }else
           mav.addObject("datos",null);
     
     mav.setViewName("reporte/prueba");
     return mav;
    }
    @RequestMapping(value="/reporte/masAlquilado.htm", method = RequestMethod.GET )
    public ModelAndView MasAlquilado(){
     mav.addObject("datos",null);
     mav.setViewName("reporte/masAlquilado");
     return mav;
    }
    @RequestMapping(value="/reporte/masAlquilado.htm", method = RequestMethod.POST )
    public ModelAndView MasAlquilado(String mes){
        System.out.println("mes =" +mes);
        if (!mes.equals("")) {
            String sql="SELECT COUNT(*) as valores, p.PEL_NOMBRE as labels FROM alquiler a , pelicula p WHERE MONTH(a.ALQ_FECHA_DESDE)="+mes
                    + " and p.PEL_ID = a.PEL_ID GROUP BY p.PEL_ID";
        List <Reporte> datos = this.jdbcTemplate.query(sql,new ReporteMapper());
        String[] labels = new String[datos.size()];
        double[] valores = new double[datos.size()];
            for (int i = 0; i < datos.size(); i++) {
                labels[i] = "'"+datos.get(i).getLabels()+"'";
                valores[i] = datos.get(i).getValores();
            }
            
            mav.addObject("datos", datos);
            System.out.println(Arrays.toString(labels));
            System.out.println("valores = "+ Arrays.toString(valores));
            mav.addObject("labels", Arrays.toString(labels));
            
            mav.addObject("valores", Arrays.toString(valores));
        }else
           mav.addObject("datos",null);
     
     mav.setViewName("reporte/masAlquilado");
     return mav;
    }
    @RequestMapping(value="/reporte/alquilerMensualTabla.htm", method = RequestMethod.GET )
    public ModelAndView AlquilerMensualTabla(){
     mav.addObject("datos",null);
     mav.setViewName("reporte/alquilerMensualTabla");
     return mav;
    }
    @RequestMapping(value="/reporte/alquilerMensualTabla.htm", method = RequestMethod.POST )
    public ModelAndView AlquilerMensualTabla(String desde, String hasta ){
        if (!desde.equals("") && !hasta.equals("")) {
            String sql="SELECT s.SOC_NOMBRE as nombre ,p.PEL_NOMBRE as pelicula,"
                    + "a.ALQ_VALOR as valor,a.ALQ_FECHA_DESDE as desde "
                    + "FROM alquiler a, pelicula p, socio s "
                    + "WHERE s.SOC_ID=a.SOC_ID AND p.PEL_ID = a.PEL_ID AND "
                    + "a.ALQ_FECHA_DESDE BETWEEN '"+desde+"' AND '"+hasta+"'";
        List datos = this.jdbcTemplate.queryForList(sql);
        
            mav.addObject("datos", datos);
        }else
           mav.addObject("datos",null);
     
     mav.setViewName("reporte/alquilerMensualTabla");
     return mav;
    }
}
