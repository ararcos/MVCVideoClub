<%-- 
    Document   : agregar
    Created on : 28/06/2019, 12:22:20
    Author     : diego
--%>
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
         <div class="container mt-4 col-lg-5" >
            <div class="card border-info">
                <div class="card-header bg-info">
                    <h4>Agregar Actor Pelicula</h4>
            </div>
                <div class="card-body">
                <form method="POST">
                     <label>ACTOR</label>
                        <div class="ml-1 form-group row">
                            <select name="actId" class="form-control mr-3 col-sm-10" >
                            <c:forEach var = "act" items="${actor}">
                                <option value="${act.ACT_ID}" >${act.ACT_NOMBRE}</option>
                            </c:forEach>
                        </select>
                            <a href="guardarActor.htm?ruta=/actorPelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0">+</a>
                        </div>
                     <label>PELICULA</label>
                        <div class="ml-1 form-group row">
                            <select name="pelId" class="form-control mr-3 col-sm-10" >
                            <c:forEach var = "pel" items="${pelicula}">
                                <option value="${pel.PEL_ID}" >${pel.PEL_NOMBRE}</option>
                            </c:forEach>
                        </select>
                            <a href="guardarPelicula.htm?ruta=/actorPelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0">+</a>
                        </div>
                    <label>PAPEL</label>
                    <input type="text" name="papel" class="form-control">
                    <input type="submit" value="Agregar" class="btn btn-success">
                    <a href="index.htm" class="btn btn-outline-warning mt-5 ml-4 col-sm-4">Regresar</a>

                </form>
                </div>
            </div>
        </div>
    </body>
</html>
