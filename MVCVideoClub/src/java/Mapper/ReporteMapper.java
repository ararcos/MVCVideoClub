/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapper;

import Models.Reporte;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author alexa
 */
public class ReporteMapper implements RowMapper<Reporte>{
     @Override
    public Reporte mapRow(ResultSet rs, int i) throws SQLException {
        Reporte reporte = new Reporte();
        reporte.setValores(rs.getInt("valores"));
        reporte.setLabels(rs.getString("labels"));
        return reporte;
    }
}
