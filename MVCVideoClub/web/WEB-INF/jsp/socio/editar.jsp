<%-- 
    Document   : editar
    Created on : 28/06/2019, 11:22:45
    Author     : diego
--%>

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
                        <h3>EDITAR SOCIO</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-4" >
                                    <div class="card border-info">

                                        <div class="card-body">
                                            <form method="POST" class="form-horizontal form-label-left input_mask">
                                                <h4>DATOS SOCIO</h4>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Cedula</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <input type="text" name="cedula" class="form-control has-feedback-left" value="${socio[0].SOC_CEDULA}">

                                                        <span class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Nombre</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <input type="text" name="nombre" class="form-control has-feedback-left" value="${socio[0].SOC_NOMBRE}">

                                                        <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Direccion</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <input type="text" name="direccion" class="form-control has-feedback-left" value="${socio[0].SOC_DIRECCION}">

                                                        <span class="fa fa-map form-control-feedback left" aria-hidden="true"></span>
                                                    </div>
                                                </div>  
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Telefono</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <input type="text" name="telefono" class="form-control has-feedback-left" value="${socio[0].SOC_TELEFONO}">

                                                        <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Correo</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <input type="text" name="correo" class="form-control has-feedback-left" value="${socio[0].SOC_CORREO}">

                                                        <span class="fa fa-mail-reply form-control-feedback left" aria-hidden="true"></span>
                                                    </div>
                                                </div>
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
        </div>
    </body>
    <%@include file="../footer.jsp" %>
</html>
