/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import Mapper.alquilerMapper;
import Mapper.peliculaMapper;
import Mapper.socioMapper;
import Models.Alquiler;
import Models.Pelicula;
import Models.Socio;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author alexa
 */
@Controller
public class AlquilerController {

    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    String ruta;
    int id;
    private int SocioId;

    @RequestMapping("/alquiler/index.htm")
    public ModelAndView Listar() {
        String sql = "SELECT a.*,s.SOC_NOMBRE,p.PEL_NOMBRE FROM alquiler a,socio s,pelicula p WHERE a.SOC_ID=s.SOC_ID AND a.PEL_ID=p.PEL_ID";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        mav.setViewName("alquiler/index");
        return mav;
    }

    @RequestMapping(value="/alquiler/agregar.htm", method = RequestMethod.GET)
    public ModelAndView Agregar() {
        String sql = "SELECT * FROM pelicula ";
        List pelicula = this.jdbcTemplate.queryForList(sql);
        mav.addObject(new Alquiler());
        mav.addObject("pelicula", pelicula);
        mav.setViewName("alquiler/agregar");
        return mav;
    }
    
    @RequestMapping(value="/alquiler/agregar.htm", method = RequestMethod.POST )
    public ModelAndView Agregar(Alquiler alquiler){
        System.out.println(alquiler.getSocio().getCedula()+" "+alquiler.getSocio().getNombre());
        if (alquiler.getSocId()==0 && alquiler.getSocio().getNombre()!="") {
            String sql="insert into socio(SOC_CEDULA,SOC_NOMBRE,SOC_DIRECCION,SOC_TELEFONO,SOC_CORREO) values(?,?,?,?,?)";
            this.jdbcTemplate.update(sql,alquiler.getSocio().getCedula(),alquiler.getSocio().getNombre(),alquiler.getSocio().getDireccion(),alquiler.getSocio().getTelefono(),alquiler.getSocio().getCorreo());
        }
        String sql = "SELECT * FROM socio WHERE SOC_CEDULA = '"+alquiler.getSocio().getCedula()+"'";
        Socio soc =new  Socio();
        soc=this.jdbcTemplate.queryForObject(sql,new socioMapper());
        String sql1="insert into alquiler(SOC_ID,PEL_ID,ALQ_FECHA_DESDE,ALQ_FECHA_HASTA,ALQ_VALOR) values(?,?,?,?,?)";
        System.out.println(sql+" "+soc.getId());
        this.jdbcTemplate.update(sql1,soc.getId(),alquiler.getPelId(),alquiler.getFechaDesde(),alquiler.getFechaHasta(),alquiler.getValor());
     return new ModelAndView("redirect:/alquiler/index.htm");
    }
    @RequestMapping(value="/alquiler/editar.htm", method = RequestMethod.GET)
    public ModelAndView Actualizar(HttpServletRequest request) {
        id=Integer.parseInt(request.getParameter("id"));
        Alquiler alquiler = new Alquiler();
        alquiler = Buscar();
        System.out.println(alquiler.getFechaEntrega());
        mav.addObject("alquiler",alquiler);
        String sql = "SELECT * FROM pelicula ";
        List pelicula = this.jdbcTemplate.queryForList(sql);
        mav.addObject("pelicula", pelicula);
        mav.setViewName("alquiler/editar");
        return mav;
    }
    
    @RequestMapping(value="/alquiler/editar.htm", method = RequestMethod.POST )
    public ModelAndView Actualizar(Alquiler alquiler){
        System.out.println(alquiler.getId());
        String sql="update alquiler set PEL_ID=?,ALQ_VALOR=?,ALQ_FECHA_DESDE=?,ALQ_FECHA_HASTA=?,ALQ_FECHA_ENTREGA=? WHERE ALQ_ID=?";
        this.jdbcTemplate.update(sql,alquiler.getPelId(),alquiler.getValor(),alquiler.getFechaDesde(),alquiler.getFechaHasta(),alquiler.getFechaEntrega(),alquiler.getId());
     return new ModelAndView("redirect:/alquiler/index.htm");
    }
     
    @RequestMapping("/alquiler/getSocio.htm" )
    public @ResponseBody String getSocio1(HttpServletRequest request){
        String sql = "SELECT * FROM socio WHERE SOC_CEDULA = '"+request.getParameter("cedula")+"'";
        Socio soc =new  Socio();
        try {
                soc=this.jdbcTemplate.queryForObject(sql,new socioMapper());
                return soc.getNombre()+","+soc.getDireccion()+","+soc.getCorreo()+","+soc.getTelefono()+","+soc.getId()+","+soc.getCedula();
        } catch (Exception e) {
        return "error";
        }
        
    }
    
    @RequestMapping("/alquiler/getCosto.htm" )
    public @ResponseBody String getCosto(HttpServletRequest request){
        String sql = "SELECT * FROM pelicula WHERE PEL_ID = "+request.getParameter("id");
        Pelicula pel =new  Pelicula();
        try {
                pel=this.jdbcTemplate.queryForObject(sql,new peliculaMapper());
                return String.valueOf(pel.getCosto());
        } catch (Exception e) {
        return "error";
        }
        
    }
    @RequestMapping(value="/alquiler/entregar.htm", method = RequestMethod.GET)
    public ModelAndView Entregar(HttpServletRequest request) {
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date date =new Date();
        System.out.println(date);
        String fecha = formato.format(date);
        System.out.println(fecha);
        int idAl=Integer.parseInt(request.getParameter("id"));
        String sql="update alquiler set ALQ_FECHA_ENTREGA=? WHERE ALQ_ID=?";
        this.jdbcTemplate.update(sql,fecha,idAl);
        return new ModelAndView("redirect:/alquiler/index.htm");
    }
    
    public Alquiler Buscar(){
        Alquiler alquiler = new Alquiler();
         String sql = "SELECT a.*,s.SOC_NOMBRE,s.SOC_TELEFONO,s.SOC_CORREO,s.SOC_DIRECCION,s.SOC_CEDULA,p.PEL_NOMBRE FROM alquiler a,socio s,pelicula p WHERE a.SOC_ID=s.SOC_ID AND a.PEL_ID=p.PEL_ID AND a.ALQ_ID="+id;
         alquiler = this.jdbcTemplate.queryForObject(sql,new alquilerMapper());
        return alquiler;
    }
}
