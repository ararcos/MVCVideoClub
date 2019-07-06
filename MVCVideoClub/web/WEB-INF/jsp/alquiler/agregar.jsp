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
                        <h3>NUEVO ALQUILER</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-6">
                                    <div class="card border-info">
                                    </div>
                                    <div class="card-body ">
                                        <form method="POST" class="form-horizontal form-label-left input_mask" >
                                            <h4>DATOS SOCIO</h4>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Cedula</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="text" name="socio.cedula" id="cedula" class="form-control  has-feedback-left" required="required" maxlength="10">
                                                    <span class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-5 col-xs-3 form-group has-feedback">
                                                    <a class="btn btn-outline-light" id="buscarSocio"><i class="fa fa-search fa-lg" aria-hidden="true"></i></a>
                                                    <label  id="error" class="text-danger" hidden></label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <input class=" col-sm-2" id="idSocio" name="socId" value="0" hidden>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <input class="form-control has-feedback-left" required="required" name="socio.nombre" id="nomSocio" readonly>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                <div class="ml-7 col-md-4 col-sm-4 col-xs-12">
                                                    <input class="form-control has-feedback-right" name="socio.telefono" id="telSocio" readonly required="required">
                                                    <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <input class="form-control has-feedback-left" name="socio.correo" id="corrSocio" readonly required="required">
                                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <input class="form-control has-feedback-right" name="socio.direccion" id="direSocio" readonly required="required">
                                                    <span class="fa fa-home form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Pelicula</label>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <select name="pelId" class="form-control mr-3 col-sm-6" id="pelId" required="required">
                                                        <option value="0" >------SELECCIONA-----</option>
                                                        <c:forEach var = "pel" items="${pelicula}">
                                                            <option value="${pel.PEL_ID}" >${pel.PEL_NOMBRE}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Precio</label>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <input type="number" name="valor" id="costo"  min="0" step="0.01" class="form-control has-feedback-right" value="0" readonly>
                                                    <span class="fa fa-dollar form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">FECHA ALQUILER</label>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <input type="Date" name="fechaDesde" class="form-control has-feedback-left" id="fechaDesde">
                                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">FECHA ENTREGA</label>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <input type="Date" name="fechaHasta" id="fechaHasta" class="form-control form-control has-feedback-left" required="required">
                                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-1">
                                                    <input type="submit" value="Guardar" class="btn btn-round btn-success col-md-4">
                                                    <a href="index.htm" class="btn btn-round  btn-warning col-md-4">Regresar</a>
                                                </div>


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
                            $("#costo").val("0")
                        } else {
                            $("#costo").val(data)
                        }
                    }
                });
            })
        });
    </script>
</html>
