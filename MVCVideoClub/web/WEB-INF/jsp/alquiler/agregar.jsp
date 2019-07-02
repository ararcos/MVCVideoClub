<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
                                            <center><h4>AGREGAR ALQUILER</h4></center>
                                            
                                        </div>  
                                    </div>
                                    <div class="card-body ">
                                        <form method="POST" >
                                            <h4>DATOS SOCIO</h4>
                                            <br>
                                            <div class="form-group row">
                                                <label class="col-sm-2">Cedula</label>
                                                <input type="text" name="socio.cedula" id="cedula" class="form-control col-sm-3">
                                                <a class="btn btn-outline-light   ml-3 col-sm-1" id="buscarSocio"><i class="fa fa-search fa-lg" aria-hidden="true"></i></a>
                                                <label  id="error" class="text-danger col-sm-4" hidden></label>
                                            </div>
                                            <div class="form-group row">
                                                <input class="form-control col-sm-2" id="idSocio" name="socId" value="0" Hidden>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">NOMBRE</label>
                                                <input class="form-control col-sm-4" name="socio.nombre" id="nomSocio" readonly>
                                                <label class="col-sm-2">TELEFONO</label>
                                                <input class="form-control col-sm-4" name="socio.telefono" id="telSocio" readonly >

                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">Corrreo</label>
                                                <input class="form-control col-sm-4" name="socio.correo" id="corrSocio" readonly >
                                                <label class="col-sm-2">DIRECCION</label>
                                                <input class="form-control col-sm-4" name="socio.direccion" id="direSocio" readonly >

                                            </div>
                                            <br>
                                            <div class="form-group row">
                                                <label class="col-sm-2">PELICULA</label>
                                                <select name="pelId" class="form-control mr-3 col-sm-6" id="pelId" >
                                                    <option value="1" >------SELECCIONA-----</option>
                                                    <c:forEach var = "pel" items="${pelicula}">
                                                        <option value="${pel.PEL_ID}" >${pel.PEL_NOMBRE}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">COSTO</label>
                                                <input type="number" name="valor" id="costo"  min="0" step="0.01" class="form-control col-sm-6" value="0" readonly>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">FECHA ALQUILER</label>
                                                <input type="Date" name="fechaDesde" id="fechaDesde" class="form-control col-sm-6" >
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2">FECHA ENTREGA</label>
                                                <input type="Date" name="fechaHasta" id="fechaHasta" class="form-control col-sm-6" >
                                            </div>

                                            <div class="ml-1 form-group row">
                                                <input type="submit" value="Guardar" class="btn btn-outline-success mt-5 col-sm-4">
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
            var now = new Date();

            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);

            var today = now.getFullYear() + "-" + (month) + "-" + (day);
            $("#fechaDesde").val(today);

            $("#buscarSocio").click(function () {
                var cedula = $("#cedula").val();
                $.ajax({
                    url: 'getSocio.htm?cedula=' + cedula,
                    success: function (data) {
                        if (data == "error") {
                            $('#error').removeAttr('hidden');
                            $("#error").html("No existe el socio");
                            $("#idSocio").removeAttr('readonly');
                            $("#nomSocio").removeAttr('readonly');
                            $("#telSocio").removeAttr('readonly');
                            $("#direSocio").removeAttr('readonly');
                            $("#corrSocio").removeAttr('readonly');
                            $("#idSocio").val("0");
                            $("#nomSocio").val("");
                            $("#telSocio").val("");
                            $("#direSocio").val("");
                            $("#corrSocio").val("");
                        } else {
                            var valores = data.split(",");
                            $("#idSocio").attr('readonly', true);
                            $("#nomSocio").attr('readonly', true);
                            $("#telSocio").attr('readonly', true);
                            $("#direSocio").attr('readonly', true);
                            $("#corrSocio").attr('readonly', true);
                            $("#idSocio").val(valores[4]);
                            $("#nomSocio").val(valores[0]);
                            $("#telSocio").val(valores[3]);
                            $("#direSocio").val(valores[1]);
                            $("#corrSocio").val(valores[2]);
                            $("#error").attr('hidden', true);
                        }
                    }
                });
            });
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
