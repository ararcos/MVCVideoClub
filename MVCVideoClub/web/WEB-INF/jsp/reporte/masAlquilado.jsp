<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header.jsp" %>
    <head>
        <script src="<c:url value="/static/Chart.min.js"/>"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>REPORTE DE PELICULAS MAS ALQUILADAS POR MES</h3>

                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="chart-container">
                                    <form method="POST" class="form-horizontal form-label-left input_mask" >
                                        <div class="form-group">
                                             <label  id="error" class="text-danger h6"> Escoja el mes que quiere consultar los alquileres </label>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <select name="mes" class="form-control mr-3 col-sm-6" id="mes" required="required">
                                                    <option value="0" >------SELECCIONA-----</option>
                                                    <c:forEach var = "mes" items="mes">
                                                        <option ect class="form-control" name="mes">
                                                        <option value="1">ENERO</option>
                                                        <option value="2">FEBRERO</option>
                                                        <option value="3">MARZO</option>
                                                        <option value="4">ABRIL</option>
                                                        <option value="5">MAYO</option>
                                                        <option value="6">JUNIO</option>
                                                        <option value="7">JULIO</option>
                                                        <option value="8">AGOSTO</option>
                                                        <option value="9">SEPTIEMBRE</option>
                                                        <option value="10">OCTUBRE</option>
                                                        <option value="11">NOVIEMBRE</option>
                                                        <option value="12">DICIEMBRE</option></option>
                                                    </c:forEach>
                                                </select>
                                               
                                                
                                            </div>
                                                                                            <br>
                                                
                                        </div>
                                        <div class="form-group">
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-1">
                                                        <input type="submit" value="Generar" class="btn btn-round btn-success col-md-4">
                                                        
                                                    </div>
                                                </div> 
                                        <label  id="error" class="text-danger h6"> </label>



                                    </form>
                                    <c:if test="${datos!=null}">
                                        <canvas id="myChart" height="20vh" width="60vw"></canvas

                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>

    <%@include file="../footer.jsp" %>
    <script>

        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'pie',

            // The data for our dataset
            data: {
                labels: ${labels},
                datasets: [{
                        backgroundColor: ["#42cef5", "#8d42f5", "#b528bd", "#d64b79", "#eff21d", "#34ab24"],
                        data:${valores}

                    }]
            },

            // Configuration options go here
            options: {
                scales: {
                    yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                }
            }
        });
    </script>
</html>