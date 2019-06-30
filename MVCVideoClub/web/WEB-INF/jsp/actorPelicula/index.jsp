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
                               <th>ACTOR</th>
                               <th>PELICULA</th>
                               <th>PAPEL</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "dato" items="${lista}">
                                <tr>
                                   
                                    <td>${dato.APL_ID}</td>
                                    
                                    <td>${dato.ACT_NOMBRE}</td>
                                    
                                    <td>${dato.PEL_NOMBRE}</td>
                                    
                                    <td>${dato.APL_PAPEL}</td>
                                    <td>
                                        <a href="editar.htm?id=${dato.APL_ID}" class="btn btn-warning">Editar</a>
                                        <a href="eliminar.htm?id=${dato.APL_ID}" class="btn btn-danger">Eliminar</a>

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
