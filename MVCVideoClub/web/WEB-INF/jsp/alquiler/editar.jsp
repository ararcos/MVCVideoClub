<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../header.jsp" %>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

        <script src="<c:url value="/static/jquery-3.4.1.min.js"/>"></script>
        <title>JSP Page</title>
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
                                <div class="container mt-4 col-lg-6">
                                    <div class="card border-info">
                                        <div class="card-header bg-info text-white">
                                            <center>
                                                <h4>EDITAR ALQUILER</h4>
                                            </center>

                                        </div>  
                                    </div>
                                    <div class="card-body ">
                                        <form method="POST" >
                                            <h4>DATOS SOCIO</h4>
                                            <br>
                                            <div class="form-group row">
                                                <label class="col-sm-2">Cedula</label>
                                                <label name="socio.cedula" class="form-control col-sm-3">${alquiler.getSocio().getCedula()}</label>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-2">NOMBRE</label>
                                                <label class="form-control col-sm-4" name="socio.nombre" >${alquiler.getSocio().getNombre()}</label>
                                                <label class="col-sm-2">TELEFONO</label>
                                                <label class="form-control col-sm-4" name="socio.telefono" >${alquiler.getSocio().getTelefono()}</label>

                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">Corrreo</label>
                                                <label class="form-control col-sm-4" name="socio.correo"  >${alquiler.getSocio().getCorreo()}</label>
                                                <label class="col-sm-2">DIRECCION</label>
                                                <label class="form-control col-sm-4" name="socio.direccion"  >${alquiler.socio.direccion}</label>

                                            </div>
                                            <br>
                                            <div class="form-group row">
                                                <label class="col-sm-2">PELICULA</label>
                                                <select name="pelId" class="form-control mr-3 col-sm-6" id="pelId" >
                                                    <c:forEach var = "pel" items="${pelicula}">
                                                        <option value="${pel.PEL_ID}"<c:if test="${alquiler.pelId==pel.PEL_ID}">selected</c:if> >${pel.PEL_NOMBRE}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">COSTO</label>
                                                <input type="number" name="valor" id="costo"  min="0" step="0.01" class="form-control col-sm-6" value="${alquiler.valor}" readonly>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">FECHA ALQUILER</label>
                                                <input type="Date" name="fechaDesde" id="fechaDesde" class="form-control col-sm-6" value="${alquiler.fechaDesde}" >
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">FECHA HASTA</label>
                                                <input type="Date" name="fechaHasta" id="fechaHasta" class="form-control col-sm-6" value="${alquiler.fechaHasta}" >
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-2">FECHA ENTREGA</label>
                                                <input type="Date" name="fechaEntrega" id="fechaHasta" class="form-control col-sm-6" value="${alquiler.fechaEntrega}" >
                                            </div>

                                            <div class="ml-1 form-group row">
                                                <input type="submit" value="Actualizar" class="btn btn-outline-success mt-5 col-sm-4">
                                                <div class="col-sm-3"></div>
                                                <a href="index.htm" class="btn btn-outline-warning mt-5 ml-4 col-sm-4">Regresar</a>

                                            </div>

                                        </form>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $('#pelId').on('change', function () {
                var id = this.value;
                $.ajax({
                    url: 'getCosto.htm?id=' + id,
                    success: function (data) {
                        if (data == "error") {
                            $("#costo").val("")
                        } else {
                            $("#costo").val(data)
                        }
                    }
                });
            })
        });
    </script>
</html>