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
                        <h3>REGISTROS DE PELICULAS</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4">
                                    <div class="card border-info">
                                            <a href="agregar.htm" class="btn btn-round btn-primary">Nuevo Registro</a>
                                        <div class="card-body">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>NOMBRE</th>
                                                        <th>GENERO</th>
                                                        <th>DIRECTOR</th>
                                                        <th>FORMATO</th>
                                                        <th>COSTO</th>
                                                        <th>FECHA ESTRENO</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var = "dato" items="${lista}">   
                                                        <tr>
                                                            <td>${dato.PEL_ID}</td>
                                                            <td>${dato.PEL_NOMBRE}</td>
                                                            <td>${dato.GEN_NOMBRE}</td>
                                                            <td>${dato.DIR_NOMBRE}</td>
                                                            <td>${dato.FOR_NOMBRE}</td>
                                                            <td>${dato.PEL_COSTO}</td>
                                                            <td>${dato.PEL_FECHA_ESTRENO}</td>
                                                            <td>
                                                                <a href="reparto.htm?id=${dato.PEL_ID}" class="btn btn-round btn-success">Reparto</a>
                                                                <a href="editar.htm?id=${dato.PEL_ID}" class="btn btn-round btn-warning">Editar</a>
                                                                <a href="eliminar.htm?id=${dato.PEL_ID}" class="btn btn-round btn-warning">Eliminar</a>

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
