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
                        <h3>REGISTRAR GENERO</h3>
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
                                            <a href="agregar.htm" class="btn btn-primary">Nuevo Registro</a>
                                        </div>    
                                        <div class="card-body">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>NOMBRE</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var = "dato" items="${lista}">
                                                        <tr>
                                                            <td>${dato.GEN_ID}</td>
                                                            <td>${dato.GEN_NOMBRE}</td>
                                                            <td>
                                                                <a href="editar.htm?id=${dato.GEN_ID}" class="btn btn-warning">Editar</a>
                                                                <a href="eliminar.htm?id=${dato.GEN_ID}" class="btn btn-warning">Eliminar</a>

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
