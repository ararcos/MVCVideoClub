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
                        <h3>REPORTE DE VENTAS MENSUALES POR AÑO</h3>

                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">

                            <div class="x_content">
                                <div class="chart-container">
                                    <form method="POST" >
                                            <label  id="error" class="text-danger h6"> Ingrese el año que quiere consultar los alquileres </label>
                                        <div class="form-group row">
                                            <label class="col-sm-2">Año</label>
                                            <input type="text" name="anio" class="form-control col-sm-3">
                                            
                                            <input type="submit" class="btn btn-outline-warning col-sm-1" value="buscar">
                                        </div>
                                        
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
            type: 'line',

            // The data for our dataset
            data: {
                labels: ${meses},
                datasets: [{
                        label: 'Alquiler Mensual',
                        borderColor: 'rgb(217, 15, 213)',
                        fill: false,
                        
                        data: ${alquiler}
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