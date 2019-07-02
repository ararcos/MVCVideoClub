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
                        <center/>
                        <h3>ALQUILER DE PELICULAS</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-5">
                                    <div class="card border-info">
                                        <div class="card-header bg-danger text-white">
                                            <h4>ELIMINAR PELICULA</h4>
                                        </div>  
                                    </div>
                                    <div class="card-body ">
                                        <h4>Esta Seguro de eliminar este elemento ? </h4>
                                        <form method="POST">
                                            <label>ID</label>
                                            <label class="form-control">${pelicula[0].PEL_ID}</label>
                                            <label>NOMBRE</label>
                                            <label class="form-control">${pelicula[0].PEL_NOMBRE}</label>
                                            <label>GENERO</label>
                                            <label class="form-control">${pelicula[0].GEN_NOMBRE}</label>
                                            <label>DIRECTOR</label>
                                            <label class="form-control">${pelicula[0].DIR_NOMBRE}</label>
                                            <label>FORMATO</label>
                                            <label class="form-control">${pelicula[0].FOR_NOMBRE}</label>
                                            <label>COSTO</label>
                                            <label class="form-control">${pelicula[0].PEL_COSTO}</label>
                                            <label>FECHA ESTRENO</label>
                                            <label class="form-control">${pelicula[0].PEL_FECHA_ESTRENO}</label>
                                            <div class="ml-1 form-group row">
                                                <input type="submit" value="Eliminar" class="btn btn-outline-success mt-3 col-sm-4">
                                                <div class="col-sm-3"></div>
                                                <a href="index.htm" class="btn btn-outline-warning mt-3 ml-4 col-sm-4">Regresar</a>

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
