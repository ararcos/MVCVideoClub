<%-- 
    Document   : eliminar
    Created on : 26/06/2019, 18:52:39
    Author     : alexa
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
                        <h3>ELIMINAR PELICULA</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-5">
                                    <div class="card-body ">
                                        <h4>Esta Seguro de eliminar este elemento ? </h4>
                                        <form method="POST" class="form-horizontal form-label-left input_mask">
                                            <h4>DATOS PELICULA</h4>
                                            <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">ID</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].PEL_ID}</label>
                                                    <span class="fa fa-user-secret form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Nombre</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].PEL_NOMBRE}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Genero</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].GEN_NOMBRE}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Ddirector</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].DIR_NOMBRE}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Formato</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].FOR_NOMBRE}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Costo</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].PEL_COSTO}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Fecha Estreno</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <label name="socio.cedula" class="form-control has-feedback-left">${pelicula[0].PEL_FECHA_ESTRENO}</label>
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-1">
                                                    <input type="submit" value="Borrar" class="btn btn-round btn-success col-md-4">
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
</html>
