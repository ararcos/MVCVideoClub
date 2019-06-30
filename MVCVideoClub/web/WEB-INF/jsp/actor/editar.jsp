<%-- 
    Document   : editar
    Created on : 28/06/2019, 12:22:56
    Author     : diego
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <h4>Actualizar Registro</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                    <label>NOMBRE</label>
                    <input type="text" name="nombre" class="form-control" value="${actor[0].ACT_NOMBRE}">
                    <label>SEXO</label>
                        <div class="ml-1 form-group row">
                            <select name="sexId" class="form-control mr-3 col-sm-10" >
                            <c:forEach var = "sex" items="${sexo}">
                                <option value="${sex.SEX_ID}" <c:if test="${actor[0].SEX_ID==sex.SEX_ID}">selected</c:if> >${sex.SEX_NOMBRE}-${sex.SEX_ID}</option>
                            </c:forEach>
                        </select>
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
    </body>
</html>
