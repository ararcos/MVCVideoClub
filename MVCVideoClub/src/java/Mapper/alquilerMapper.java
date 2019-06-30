/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapper;

import Models.Alquiler;
import Models.Socio;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author alexa
 */
public class alquilerMapper implements RowMapper<Alquiler>{

    @Override
    public Alquiler mapRow(ResultSet rs, int i) throws SQLException {
        Alquiler alquiler = new Alquiler();
        alquiler.setId(rs.getInt("ALQ_ID"));
        alquiler.setSocId(rs.getInt("SOC_ID"));
        alquiler.setPelId(rs.getInt("PEL_ID"));
        alquiler.setFechaDesde(rs.getString("ALQ_FECHA_DESDE"));
        alquiler.setFechaHasta(rs.getString("ALQ_FECHA_HASTA"));
        alquiler.setValor(rs.getDouble("ALQ_VALOR"));
        alquiler.setFechaEntrega(rs.getString("ALQ_FECHA_ENTREGA"));
        Socio socio = new Socio();
        socio.setCedula(rs.getString("SOC_CEDULA"));
        socio.setNombre(rs.getString("SOC_NOMBRE"));
        socio.setCorreo(rs.getString("SOC_CORREO"));
        socio.setDireccion(rs.getString("SOC_DIRECCION"));
        socio.setTelefono(rs.getString("SOC_TELEFONO"));
        alquiler.setSocio(socio);
        return alquiler;
    }
    
}
