<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body class="nav-md">
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>BIENVENIDO </h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12" align="center">
                        <div class="x_panel" align="center">

                            <div class="x_content" align="center" >
                                <div class="row tile_count" align="center">
                                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                                        <span class="count_top"><i class="fa fa-user"></i> Total Alquileres hechos</span>
                                        <div class="count">${alquilerNumero}</div>
                                        <span class="count_bottom"><i class="green"><a href="reporte/alquilerMensual.htm" class="btn btn-round  btn-dark col-md-4">Ver</a></i> </span>
                                    </div>
                                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" align="center">
                                        <span class="count_top"><i class="fa fa-film"></i> Pelicula mas alquiladas</span>
                                   
                                        <h3>${pelicula}</h3>
                                        <span class="count_bottom"><i class="green"><a href="reporte/masAlquilado.htm" class="btn btn-round  btn-dark col-md-4">Ver</a></i> </span>

                                    </div>

                                </div>
                            </div>


                        </div>
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>VIDEO CLUB</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content" align="left">

                                <a class="btn btn-app" href="alquiler/agregar.htm" >
                                    <i class="fa fa-plus fa-lg"> </i>Alquiler
                                </a>
                                <a class="btn btn-app" href="pelicula/agregar.htm" >
                                    <i class="fa fa-plus fa-lg"> </i>Pelicula
                                </a>
                                <a class="btn btn-app" href="socio/agregar.htm" >
                                    <i class="fa fa-user fa-lg"> </i>Socio
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
    <%@include file="footer.jsp" %>
</html>
