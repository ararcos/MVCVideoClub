<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Agregar Actor</title>
    </head>
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <center/>
                    <h3>Agregar Actor</h3>
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
                                            <label>NOMBRE</label>
                                            <input type="text" name="nombre" class="form-control">
                                            <label>SEXO</label>
                                            <div class="ml-1 form-group row">
                                                <select name="sexId" class="form-control mr-3 col-sm-10" >
                                                    <c:forEach var = "sex" items="${sexo}">
                                                        <option value="${sex.SEX_ID}" >${sex.SEX_NOMBRE}-${sex.SEX_ID}</option>
                                                    </c:forEach>
                                                </select>
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
    </div>
</body>
<%@include file="../footer.jsp" %>

</html>
