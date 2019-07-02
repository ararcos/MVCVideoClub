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
                                <div class="container mt-4">
                                    <div class="card border-info">
                                        <div class="card-header bg-info text-white">
                                            <h4>Reparto de ${actor.pelicula.nombre}</h4>
                                        </div>
                                        <div class="card-body">
                                            <form method="POST">
                                                <div class="form-group row">
                                                    <label class="col-sm-1">ACTOR</label>

                                                    <select name="actId" class="form-control col-sm-4" >
                                                        <c:forEach var = "act" items="${listActor}">
                                                            <option value="${act.ACT_ID}" >${act.ACT_NOMBRE}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-sm-1">PAPEL</label>
                                                    <input type="text" name="papel" class="form-control col-sm-4">
                                                </div>
                                                <div class="ml-1 form-group row">
                                                    <input type="submit" value="AÑADIR" class="btn btn-outline-success col-sm-3 mr-3">
                                                    <a href="index.htm" class="btn btn-outline-warning  col-sm-3">Regresar</a>

                                                </div>

                                            </form>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>ACTOR</th>
                                                        <th>PAPEL</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var = "dato" items="${actores}">   
                                                        <tr>
                                                            <td>${dato.APL_ID}</td>
                                                            <td>${dato.ACT_NOMBRE}</td>
                                                            <td>${dato.APL_PAPEL}</td>
                                                            <td>
                                                                <a href="editarReparto.htm?id=${dato.PEL_ID}" class="btn btn-warning">Editar</a>
                                                                <a href="eliminarReparto.htm?id=${dato.PEL_ID}" class="btn btn-warning">Eliminar</a>

                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

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
