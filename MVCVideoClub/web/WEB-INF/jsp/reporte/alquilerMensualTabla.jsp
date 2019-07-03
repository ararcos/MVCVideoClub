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

                        <h3>Reporte de Alquiler por Fecha</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4">
                                    <div class="card border-info">
                                        <form method="POST" >
                                            
                                            <div class="row">
                                                <label class="col-sm-2">DESDE</label>
                                                <input type="Date" name="desde" class="form-control col-sm-6" >
                                            </div>
                                            <div class="row">
                                                <label class="col-sm-2">HASTA</label>
                                                <input type="Date" name="hasta" class="form-control col-sm-6" >
                                            </div>
                                                    <br>
                                                <input type="submit" value="Buscar" class="btn btn-outline-success ml-5 col-sm-3">

                                        </form>
                                        <div class="card-body">
                                            <c:if test="${datos!=null}">
                                             <a href="" class="btn btn-primary">IMPRIMIR</a>   
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>FECHA</th>
                                                        <th>SOCIO</th>
                                                        <th>PELICULA</th>
                                                        <th>VALOR</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var = "dato" items="${datos}">   
                                                        <tr>
                                                            <td>${dato.desde}</td>
                                                            <td>${dato.nombre}</td>
                                                            <td>${dato.pelicula}</td>
                                                            <td>${dato.valor}</td>
                                                            </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
   
                                            </c:if>
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
