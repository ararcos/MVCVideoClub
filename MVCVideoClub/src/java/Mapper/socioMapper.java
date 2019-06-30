/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapper;


import Models.Socio;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author alexa
 */
public class socioMapper implements RowMapper<Socio>{

    @Override
    public Socio mapRow(ResultSet rs, int i) throws SQLException {
        Socio socio = new Socio();
       socio.setId(rs.getInt("SOC_ID"));
       socio.setNombre(rs.getString("SOC_NOMBRE"));
       socio.setCedula(rs.getString("SOC_CEDULA"));  
       socio.setCorreo(rs.getString("SOC_CORREO"));   
       socio.setDireccion(rs.getString("SOC_DIRECCION"));   
       socio.setTelefono(rs.getString("SOC_TELEFONO"));     

  return socio;
    }
    
}
