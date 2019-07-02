<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                <div class="container mt-4 col-lg-4" >
                                    <div class="card border-info">
                                        <div class="card-header bg-info">
                                            <h4>Agregar Usuario</h4>
                                        </div>
                                        <div class="card-body">
                                            <form method="POST">
                                                <label>CEDULA</label>
                                                <input type="text" name="cedula" class="form-control">
                                                <label>NOMBRE</label>
                                                <input type="text" name="nombre" class="form-control">
                                                <label>DIRECCION</label>
                                                <input type="text" name="direccion" class="form-control">
                                                <label>TELEFONO</label>
                                                <input type="text" name="telefono" class="form-control">
                                                <label>CORREO</label>
                                                <input type="text" name="correo" class="form-control">
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
        </div>
    </body>
    <%@include file="../footer.jsp" %>
</html>
