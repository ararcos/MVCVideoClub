<%-- 
    Document   : editar
    Created on : 28/06/2019, 12:22:56
    Author     : diego
--%>
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
                        <h3>EDITAR ACTOR</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="container mt-4 col-lg-5" >
                                    <div class="card border-info">

                                        <div class="card-body">
                                            <form method="POST" class="form-horizontal form-label-left input_mask">
                                                <h4>DATOS ACTOR</h4>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Actor</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <select name="actId" class="form-control mr-3 col-sm-6" id="actId" >
                                                            <c:forEach var = "act" items="${actor}">
                                                                <option value="${act.ACT_ID}" <c:if test="${actorPelicula[0].ACT_ID==act.ACT_ID}">selected</c:if> >${act.ACT_NOMBRE}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Pelicula</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <select name="pelId" class="form-control mr-3 col-sm-6" id="pelId" >
                                                            <c:forEach var = "pel" items="${pelicula}">
                                                                <option value="${pel.PEL_ID}" <c:if test="${actorPelicula[0].PEL_ID==pel.PEL_ID}">selected</c:if>>${pel.PEL_NOMBRE}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-1 col-sm-1 col-xs-12">Papel</label>
                                                    <div class="col-md-4 col-sm-4 col-xs-9">
                                                        <input type="text" name="papel" class="form-control has-feedback-left"value="${actorPelicula[0].APL_PAPEL}">

                                                        <span class="fa fa-star form-control-feedback left" aria-hidden="true"></span>
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
