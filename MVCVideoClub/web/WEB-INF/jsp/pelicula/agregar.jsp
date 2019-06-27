<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-5">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                <h4>AGREGAR PELICULA</h4>
                </div>  
            </div>
            <div class="card-body ">
                <form method="POST" id="prueba">
                        <label>NOMBRE</label>
                        <input type="text" name="nombre" class="form-control">
                        <label>GENERO</label>
                        <div class="ml-1 form-group row">
                            <select name="genId" class="form-control mr-3 col-sm-10" >
                            <c:forEach var = "gen" items="${genero}">
                                <option value="${gen.GEN_ID}" >${gen.GEN_NOMBRE}-${gen.GEN_ID}</option>
                            </c:forEach>
                        </select>
                        <a href="agregarGenero.htm?ruta=/pelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0">+</a>
                        </div>
                        
                        <label>DIRECTOR</label>
                        <div class="ml-1 form-group row">
                        <select name="dirId" class="form-control mr-3 col-sm-10" >
                            <c:forEach var = "dir" items="${director}">
                                  <option value="${dir.DIR_ID}">${dir.DIR_NOMBRE}-${dir.DIR_ID}</option>
                            </c:forEach>
                        </select>
                            <a href="agregarDirector.htm?ruta=/pelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0">+</a>
                        </div>
                        <label>FORMATO</label>
                        <div class="ml-1 form-group row">
                        <select name="forId" class="form-control mr-3 col-sm-10" >
                            <c:forEach var = "for" items="${formato}">
                                  <option value="${for.FOR_ID}" >${for.FOR_NOMBRE}-${for.FOR_ID}</option>
                            </c:forEach>
                        </select>
                        <a href="agregarFormato.htm?ruta=/pelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0">+</a>
                        </div>
                        <label>COSTO</label>
                        <input type="number" name="costo"  min="0" step="0.01" class="form-control" >
                        <label>FECHA DE ESTRENO</label>
                        <input type="Date" name="fecha" class="form-control" >
                        <div class="ml-1 form-group row">
                            <input type="submit" value="Guardar" class="btn btn-outline-success mt-5 col-sm-4">
                            <div class="col-sm-3"></div>
                        <a href="index.htm" class="btn btn-outline-warning mt-5 ml-4 col-sm-4">Regresar</a>

                        </div>
                        
                    </form>
                </div>
        </div>
    </body>
</html>
