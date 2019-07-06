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
                        <h3>EDITAR ALQUILER</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-6">
                                    <div class="card-body ">
                                        <form method="POST" class="form-horizontal form-label-left input_mask">
                                            <h4>DATOS SOCIO</h4>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Cedula</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${alquiler.getSocio().getCedula()}</label>
                                                    <span class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label class="form-control has-feedback-left" name="socio.nombre" >${alquiler.getSocio().getNombre()}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label class="form-control has-feedback-right" name="socio.telefono" >${alquiler.getSocio().getTelefono()}</label>
                                                    <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-1 col-sm-1 col-xs-0"></div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label class="form-control has-feedback-left" name="socio.correo" >${alquiler.getSocio().getCorreo()}</label>
                                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label class="form-control has-feedback-right" name="socio.direccion" >${alquiler.socio.direccion}</label>
                                                    <span class="fa fa-home form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Pelicula</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <select name="pelId" class="form-control mr-3 col-sm-6" id="pelId" >
                                                        <c:forEach var = "pel" items="${pelicula}">
                                                            <option value="${pel.PEL_ID}"<c:if test="${alquiler.pelId==pel.PEL_ID}">selected</c:if> >${pel.PEL_NOMBRE}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Precio</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="number" name="valor" id="costo"  min="0" step="0.01" class="form-control has-feedback-right" value="${alquiler.valor}" readonly>
                                                    <span class="fa fa-dollar form-control-feedback right" aria-hidden="true"></span>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Fecha Alquiler</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="Date" name="fechaDesde" id="fechaDesde" class="form-control has-feedback-left" required="required" value="${alquiler.fechaDesde}" >
                                                    <span class="fa fa-calendar form-control-feedback left" aria-hidden="true"></span>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Fecha Hasta</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="Date" name="fechaHasta" id="fechaHasta" class="form-control has-feedback-left" required="required" value="${alquiler.fechaHasta}" >
                                                    <span class="fa fa-calendar form-control-feedback left" aria-hidden="true"></span>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Fecha Entrega</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="Date" name="fechaEntrega" id="fechaHasta" class="form-control has-feedback-left" required="required" value="${alquiler.fechaEntrega}" >
                                                    <span class="fa fa-calendar form-control-feedback left" aria-hidden="true"></span>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-1">
                                                    <input type="submit" value="Actualizar" class="btn btn-round btn-success col-md-4">
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