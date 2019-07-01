<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css"/>"/>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css"/>"/>
    
    <!-- NProgress -->
    <link rel="stylesheet" href="<c:url value="/resources/vendors/nprogress/nprogress.css"/>"/>
    

    <!-- Custom Theme Style -->
    <link rel="stylesheet" href="<c:url value="/resources/build/css/custom.min.css"/>"/>
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="/MVCVideoClub/index.htm" class="site_title"><i class="fa fa-film"></i> <span>Video Club</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
         
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
               <li><a href="/MVCVideoClub/alquiler/agregar.htm"><i class="fa fa-plus"></i>Nuevo Alquiler </a></li>
                  <li><a><i class="fa fa-edit"></i>Registrar <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/MVCVideoClub/socio/agregar.htm">Socio</a></li>
                      <li><a href="/MVCVideoClub/pelicula/agregar.htm">Pelicula</a></li>
                      <li><a href="/MVCVideoClub/actorPelicula/agregar.htm">Actores Peliculas</a></li>
                      <li><a href="/MVCVideoClub/actor/agregar.htm">Actores Peliculas</a></li>
                      <li><a href="/MVCVideoClub/director/agregar.htm">Directores Peliculas</a></li>
                      <li><a href="/MVCVideoClub/genero/agregar.htm">Generos Peliculas</a></li>
                      <li><a href="/MVCVideoClub/formato/agregar.htm">Formatos Peliculas</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-list"></i>Registros<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/MVCVideoClub/alquiler/index.htm">Alquiler</a></li>
                      <li><a href="/MVCVideoClub/pelicula/index.htm">Pelicula</a></li>
                      <li><a href="/MVCVideoClub/socio/index.htm">Socio</a></li>
                      <li><a href="/MVCVideoClub/actor/index.htm">Actores</a></li>
                      <li><a href="/MVCVideoClub/formato/index.htm">Formato</a></li>
                      <li><a href="/MVCVideoClub/generos/index.htm">Generos</a></li>
                      <li><a href="/MVCVideoClub/directores/index.htm">Directores</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>Reportes<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Estadisticos</a></li>
                      <li><a href="tables_dynamic.html">Tablas</a></li>
                    </ul>
                  </li>
                                 
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="/MVCVideoClub/resources/images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="/MVCVideoClub/resources/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/MVCVideoClub/resources/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/MVCVideoClub/resources/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/MVCVideoClub/resources/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
