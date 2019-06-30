<%-- 
    Document   : eliminar
    Created on : 28/06/2019, 12:11:48
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">       
       
        <title>rliminar Socio</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4" >
            <div class="card border-info">
                <div class="card-header bg-info">
                    <h4>Esta Seguro de eliminar este elemento ?</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>CEDULA</label>
                        <label class="form-control" >${socio[0].SOC_CEDULA}</label>
                        <label>NOMBRE</label>
                        <label class="form-control">${socio[0].SOC_NOMBRE} </label>
                        <label>DIRECCION</label>
                        <label class="form-control">${socio[0].SOC_DIRECCION} </label>
                        <label>TELEFONO</label>
                        <label class="form-control">${socio[0].SOC_TELEFONO} </label>
                        <label>CORREO</label>
                        <label class="form-control">${socio[0].SOC_CORREO} </label>
                        <div class="ml-1 form-group row">
                            <input type="submit" value="Eliminar" class="btn btn-outline-success mt-5 col-sm-4">
                            <div class="col-sm-3"></div>
                        <a href="index.htm" class="btn btn-outline-warning mt-5 ml-4 col-sm-4">Regresar</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
