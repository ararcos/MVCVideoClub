<%-- 
    Document   : agregar
    Created on : 28/06/2019, 12:22:20
    Author     : diego
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="../header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <center/>
                        <h3>ALQUILER DE PELICULAS</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="../footer.jsp" %>
</html>

