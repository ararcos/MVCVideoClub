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
                        <h3>Reparto de ${actor.pelicula.nombre}</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4">
                                    <div class="card border-info">
                                        <div class="card-body">
                                            <form method="POST" class="form-horizontal form-label-left input_mask">
                                                <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Actor</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <select name="actId" class="form-control col-sm-4" >
                                                        <c:forEach var = "act" items="${listActor}">
                                                            <option value="${act.ACT_ID}" >${act.ACT_NOMBRE}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                
                                            </div>
                                                <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Papel</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="text" name="papel" class="form-control has-feedback-left">
                                                    <span class="fa fa-book form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                
                                            </div>
                                                <br>
                                                <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-1">
                                                    <input type="submit" value="Añadir" class="btn btn-round btn-success col-md-4"  required="required">
                                                    <a href="index.htm" class="btn btn-round  btn-warning col-md-4">Regresar</a>
                                                </div>


                                            </div>

                                            </form>
                                            <br>
<br>
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
                                                                <a href="editarReparto.htm?id=${dato.APL_ID}" class="btn btn-warning">Editar</a>
                                                                <a href="eliminarReparto.htm?id=${dato.APL_ID}" class="btn btn-warning">Eliminar</a>
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
