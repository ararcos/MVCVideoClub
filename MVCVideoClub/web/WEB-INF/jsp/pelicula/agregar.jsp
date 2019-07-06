<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h3>NUEVA PELICULA</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-5">
                                    <div class="card border-info">
                                    </div>
                                    <div class="card-body ">
                                        <form method="POST" id="prueba" class="form-horizontal form-label-left input_mask">
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Nombre</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="text" name="nombre" class="form-control  has-feedback-left" required="required">
                                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Genero</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <select name="genId" class="form-control mr-3 col-sm-10" >
                                                    <c:forEach var = "gen" items="${genero}">
                                                        <option value="${gen.GEN_ID}" >${gen.GEN_NOMBRE}-${gen.GEN_ID}</option>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <a href="agregarGenero.htm?ruta=/pelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0"><i class="fa fa-plus"></i></a>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Director</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <select name="dirId" class="form-control mr-3 col-sm-10" >
                                                    <c:forEach var = "dir" items="${director}">
                                                        <option value="${dir.DIR_ID}">${dir.DIR_NOMBRE}-${dir.DIR_ID}</option>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <a href="agregarDirector.htm?ruta=/pelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0"><i class="fa fa-plus"></i></a>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Formato</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <select name="forId" class="form-control mr-3 col-sm-10" >
                                                    <c:forEach var = "for" items="${formato}">
                                                        <option value="${for.FOR_ID}" >${for.FOR_NOMBRE}-${for.FOR_ID}</option>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <a href="agregarFormato.htm?ruta=/pelicula/agregar.htm" class="btn btn-outline-danger ml-4 col-sm-0"><i class="fa fa-plus"></i></a>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Precio</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="number" name="costo"  min="0" step="0.01" max="1000" class="form-control has-feedback-left" required="required">
                                                    <span class="fa fa-dollar form-control-feedback left" aria-hidden="true"></span>
                                                </div>
                                                
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-1 col-sm-1 col-xs-12">Fecha de Estreno</label>
                                                <div class="col-md-4 col-sm-4 col-xs-9">
                                                    <input type="Date" name="fecha" class="form-control has-feedback-left" required="required">
                                                    <span class="fa fa-calendar form-control-feedback left" aria-hidden="true" ></span>
                                                </div>
                                                
                                            </div>
                                            
                                            
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
</html>

