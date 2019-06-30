/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapper;

import Models.Pelicula;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author alexa
 */
public class peliculaMapper implements RowMapper<Pelicula>{

    @Override
    public Pelicula mapRow(ResultSet rs, int i) throws SQLException {
        Pelicula pelicula = new Pelicula();
       pelicula.setId(rs.getInt("PEL_ID")); 
        pelicula.setGenId(rs.getInt("GEN_ID"));
        pelicula.setCosto(rs.getDouble("PEL_COSTO")); 
        pelicula.setDirId(rs.getInt("DIR_ID")); 
        pelicula.setFecha(rs.getString("PEL_FECHA_ESTRENO")); 
        pelicula.setForId(rs.getInt("FOR_ID")); 
        pelicula.setNombre(rs.getString("PEL_NOMBRE")); 
  return pelicula;
    }
}
