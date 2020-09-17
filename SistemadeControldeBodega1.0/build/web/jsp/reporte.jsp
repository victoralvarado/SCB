<%-- 
    * @Documento: reporte.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page session="true" %>
<%@page import="java.util.List"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reporte | SCB</title>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <!-- CSS -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../fonts/Linearicons/style.css">
        <link rel="stylesheet" href="../others/style.css">
        <link rel="stylesheet" href="../css/chartist-custom.css">
        <link rel="stylesheet" href="../css/main.css">
        <link rel="stylesheet" href="../css/demo.css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
        <link rel="apple-touch-icon" sizes="76x76" href="../multimedia/imagenes/Login/logoHerramienta.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../multimedia/imagenes/Login/logoHerramienta.png">
        <!-- ESCRIPTS -->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/script.js"></script>
    </head>
    <%
        String user = "";
        String us = "";
        String li = "";
        String li2 = "";
        String href = "";
        String col = "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "" + usuario + "";
            us = "ADMINISTRADOR";
            li = "<li><a href='../jsp/' class=''><i class='fa fa-home'></i> <span> Inicio Administrador</span></a></li>";
            li2 = "<li><a href='../jsp/manteUsuario.jsp' class=''><i class='lnr lnr-users'></i> Usuarios</a></li>";
            href = "../jsp/";
            col = "col-md-3";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "" + usuario + "";
            us = "EDITOR";
            li = "<li><a href='../jsp/' class=''><i class='fa fa-home'></i> <span> Inicio Editor</span></a></li>";
            href = "../jsp/";
            col = "col-md-4";
        } else {
            out.print("<script>location.replace('../');</script>");
        }
        //Contador de registros de cada tabla
        int cont = 0;
        //Dao's
        DaoUsuario daoUs = new DaoUsuario();
        DaoHerramienta daoHe = new DaoHerramienta();
        DaoPersonal daoPe = new DaoPersonal();
        DaoDetallePrestamo daoDe = new DaoDetallePrestamo();
        //Mostrar Datos de las tablas
        List<Usuario> listU = daoUs.mostarUsuario();
        List<Herramienta> listH = daoHe.mostrarHerramienta();
        List<Herramienta> listHU = daoHe.mostrarHerramientaUso();
        List<Personal> listP = daoPe.mostarPersonal();
        List<DetallePrestamo> listPP = daoDe.prestamoPersonal();
    %>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="brand">
                    <a href="../jsp/"><p style=" color: wheat; font-family: fantasy;">Sistema de Control de Bodega</p></a>
                </div>
                <div class="container-fluid">
                    <div class="navbar-btn">
                        <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
                    </div>
                    <div id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><span> <%=us%></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li class="bg bg-info"><i class="lnr lnr-user"></i> <span><%=user%></span></li>
                                    <li><a href="close.jsp"><i class="lnr lnr-exit"></i> <span>Salir</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id="sidebar-nav" class="sidebar">
                <div class="sidebar-scroll">
                    <nav>
                        <ul class="nav">
                            <%=li%>
                            <li><a href="../jsp/nuevoPrestamo.jsp" class=""><i class="fa fa-plus-circle"></i> <span>Nuevo Prestamo</span></a></li>
                            <li><a href="../jsp/reporte.jsp" class="active"><i class="fa fa-file-pdf-o"></i> <span>Reportes</span></a></li>
                            <li><a href="../jsp/devoluciones.jsp" class=""><i class="fa fa-clipboard"></i> <span>Historial Devolucion</span></a></li>
                            <li><a href="../jsp/historial.jsp" class=""><i class="fa fa-list-ul"></i> <span>Historial Prestamos</span></a></li>
                            <li>
                                <a href="#subPages" data-toggle="collapse" class="collapsed "><i class="lnr lnr-pencil"></i> <span>Gestionar</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPages" class="collapse ">
                                    <ul class="nav">
                                        <%=li2%>
                                        <li><a href="../jsp/manteHerramienta.jsp" class=""><i class="fa fa-gavel"></i> Herramientas</a></li>
                                        <li><a href="../jsp/mantePersonal.jsp" class=""><i class="fa fa-male"></i> Personal</a></li>
                                        <li><a href="../jsp/manteCategoria.jsp" class=""><i class="fa fa-cog"></i> Categorias</a></li>
                                        <li><a href="../jsp/mantePrestamo.jsp" class=""><i class="fa fa-list-ol"></i> Prestamo</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="main">
                <div class="main-content" >
                    <div class="container-fluid" >
                        <div class="panel panel-headline">
                            <div class="panel-heading bg bg-info">
                                <h3 class="panel-title" style="font-family: fantasy; text-align: center;">Informacion</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="<%=col%>">
                                        <div class="metric">
                                            <!-- CODIGO PARA CONTAR HERRAMIENTAS -->
                                            <%
                                                cont = 0;
                                                for (Herramienta he : listH) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <!--                                 -->
                                            <span class="icon"><i class="fa fa-gavel"></i></span>
                                            <p>
                                                <span class="number"><% out.write("" + (cont) + "");%></span>
                                                <span class="title">Total de Herramientas</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="<%=col%>" >
                                        <div class="metric">
                                            <!-- CODIGO PARA CONTAR HERRAMIENTAS EN USO -->
                                            <%
                                                cont = 0;
                                                for (Herramienta he : listHU) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <!--                                        -->
                                            <span class="icon"><i class="lnr lnr-briefcase"></i></span>
                                            <p>
                                                <span class="number"><% out.write("" + (cont) + "");%></span>
                                                <span class="title">Herramientas en uso</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="<%=col%>">
                                        <div class="metric">
                                            <!-- CODIGO PARA CONTAR PERSONAL -->
                                            <%
                                                cont = 0;
                                                for (Personal pe : listP) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <!--                             -->
                                            <span class="icon"><i class="fa fa-male"></i></span>
                                            <p>
                                                <span class="number"><% out.write("" + (cont) + "");%></span>
                                                <span class="title">Total de Personal</span>
                                            </p>
                                        </div>
                                    </div>
                                    <%
                                        if (us.equals("ADMINISTRADOR")) {
                                    %>
                                    <div class="col-md-3"> <a 
                                            href = "../jsp/manteUsuario.jsp"> <div class="metric" >
                                                <!-- CODIGO PARA CONTAR USUARIOS -->
                                                <%
                                                    cont = 0;
                                                    //Recorrer lista de Usuarios
                                                    for (Usuario usua : listU) {
                                                        //Contar Numero de Usuario
                                                        for (int i = 0; i < 1; i++) {
                                                            cont = cont + 1;
                                                        }
                                                    }
                                                %>
                                                <!--                             -->
                                                <span class="icon"><i class="lnr lnr-users"></i></span>
                                                <p>
                                                    <span class="number"><% out.write("" + (cont) + "");%></span>
                                                    <span class="title">Total de Usuarios</span>
                                                </p>
                                            </div>
                                        </a>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="panel-heading bg bg-info">
                            <h3 class="panel-title" style="font-family: fantasy; text-align: center;">Reporte</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-file-pdf-o"></i> Reporte Prestamo</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <form action="reportePrestamo.jsp" target="_blanck" method="POST">
                                            <label>Seleccione un Nombre de Empleado: </label>
                                            <select name="txtIdPersonal" class="form-control" required>
                                                <option disabled selected value="">Seleccione</option>
                                                <%
                                                    for (DetallePrestamo de : listPP) {
                                                %>
                                                <option value="<%=de.getIdPersonal()%>"><%=de.getNombre()%> <%=de.getApellido()%> [<%=de.getIdPersonal()%>]</option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <input type="hidden" value="<%=user%>" name="user">
                                            <input type="submit" class="btn btn-primary" value="Generar Reporte">
                                            <br>
                                            <br>
                                            <br>
                                            <br>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-file-pdf-o"></i> Reporte Herramienta</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                        <%
                                            cont = 0;
                                            String hi = "";
                                            //Recorrer lista de Usuarios
                                            for (DetallePrestamo de : listPP) {
                                                //Contar Numero de Usuario
                                                for (int i = 0; i < 1; i++) {
                                                    cont = cont + 1;
                                                }
                                            }
                                            if (cont == 0) {
                                                hi = "hidden=''";
                                            }
                                        %>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <label>Generar por: </label>
                                        <form id="myform" target="_blanck" method="post" name="myform">
                                            <input type="hidden" value="<%=user%>" name="user">
                                            <input type="hidden" value="<%= (new java.util.Date()).toLocaleString()%>" name="fh">
                                            <select id="db" required class="form-control">
                                                <option disabled selected value="">Seleccione</option>
                                                <option>Categoria</option>
                                                <option>Nuevas</option>
                                                <option>Herramientas Disponibles</option>
                                                <option <%=hi%>>En Uso</option>
                                                <option <%=hi%>>Reporte Herramientas Prestadas por Persona</option>
                                                <option>Reporte Herramientas Defectuosas</option>
                                            </select>
                                            <input class="submit btn btn-info" id="submit" type="submit" value="Generar Reporte">
                                        </form>
                                        <br>
                                        <br>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-file-pdf-o"></i> Reporte Historial</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <form action="../jsp/reporteDevoluciones.jsp" target="_blanck" method="post">
                                            <input type="hidden" value="<%=user%>" name="user">
                                            <input class="submit btn btn-info" id="submit" type="submit" value="REPORTE HISTORIAL DEVOLUCIONES">
                                        </form>
                                        <br>
                                        <form action="../jsp/reporteHistorial.jsp" target="_blanck" method="post">
                                            <input type="hidden" value="<%=user%>" name="user">
                                            <input class="submit btn btn-info" id="submit" type="submit" value="REPORTE HISTORIAL PRESTAMOS">
                                        </form>
                                        <br>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <footer class="col-md-12">
                <div class="container-fluid">
                    <p class="copyright">
                        Copyright © Sistema de Control de Bodega 
                        <script>
                            copyright = new Date();
                            update = copyright.getFullYear();
                            document.write(" 2018 - " + update);
                        </script> All right reserved.
                    </p>
                </div>
            </footer>
        </div>
        <!-- Javascript -->
        <script src="../js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script src="../js/jquery.slimscroll.min.js"></script>
        <script src="../js/jquery.easypiechart.min.js"></script>
        <script src="../js/chartist.min.js"></script>
        <script src="../js/klorofil-common.js"></script>
    </body>
</html>