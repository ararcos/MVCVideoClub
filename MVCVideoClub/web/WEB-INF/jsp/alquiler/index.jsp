<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="<c:url value="/static/jquery-3.4.1.min.js"/>"></script>
        <title>Club de Videos</title>
    </head>

    <body>
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">

                        <h3>Registrar Alquiler</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4">
                                    <div class="card border-info">
                                        <a href="agregar.htm" class="btn btn-primary">Nuevo Registro</a>   
                                        <div class="card-body">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>SOCIO</th>
                                                        <th>PELICULA</th>
                                                        <th>FECHA DESDE</th>
                                                        <th>FECHA HASTA</th>
                                                        <th>VALOR</th>
                                                        <th>FECHA ENTREGA</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var = "dato" items="${lista}">   
                                                        <tr>
                                                            <td>${dato.ALQ_ID}</td>
                                                            <td>${dato.SOC_NOMBRE}</td>
                                                            <td>${dato.PEL_NOMBRE}</td>
                                                            <td>${dato.ALQ_FECHA_DESDE}</td>
                                                            <td>${dato.ALQ_FECHA_HASTA}</td>
                                                            <td>${dato.ALQ_VALOR}</td>
                                                            <td>${dato.ALQ_FECHA_ENTREGA}</td>
                                                            <td>
                                                                <a href="editar.htm?id=${dato.ALQ_ID}" class="btn btn-warning">Editar</a>
                                                                <a href="eliminar.htm?id=${dato.ALQ_ID}" class="btn btn-warning">Eliminar</a>

                                                                <c:if test="${dato.ALQ_FECHA_ENTREGA == null}"><a href="entregar.htm?id=${dato.ALQ_ID}" class="btn btn-danger" id="entregar">Entregar</a></c:if>


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
        <%@include file="../footer.jsp" %>
    </body>
</html>
