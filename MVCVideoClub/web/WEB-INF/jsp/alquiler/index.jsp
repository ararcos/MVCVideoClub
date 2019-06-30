<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <script src="<c:url value="/static/jquery-3.4.1.min.js"/>"></script>
        <title>Club de Videos</title>
    </head>

    <body>
        <div class="container mt-4">
            <div class="card border-info">
            <div class="card-header bg-info text-white">
                <a href="agregar.htm" class="btn btn-primary">Nuevo Registro</a>
            </div>    
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
    </body>
</html>
