<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
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
                    <input type="submit" value="Agregar" class="btn btn-success">
                    <a href="index.htm" class="btn btn-outline-warning mt-5 ml-4 col-sm-4">Regresar</a>

                </form>
                </div>
            </div>
        </div>
    </body>
</html>
