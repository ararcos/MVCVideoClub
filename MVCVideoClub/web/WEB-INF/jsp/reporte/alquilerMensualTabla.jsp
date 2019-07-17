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
                                        <form method="POST" class="form-horizontal form-label-left input_mask" >

                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">DESDE</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="Date" name="desde" class="form-control  has-feedback-left" required="required" >

                                                    <span class="fa fa-search form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">HASTA</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="Date" name="hasta" class="form-control  has-feedback-left" required="required"  >

                                                    <span class="fa fa-search form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>

                                            <br>
                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-1">
                                                    <input type="submit" value="Buscar" class="btn btn-round btn-success col-md-4">
                                                </div>


                                            </div>

                                        </form>
                                        <div class="card-body">
                                            <c:if test="${datos!=null}">
                                                <a href="imprimirPDF.htm" class="btn btn-primary">IMPRIMIR</a>   
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
