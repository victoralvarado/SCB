<%-- 
    * @Documento: historial.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page session="true" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Historial | SCB</title>
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
        DaoHistorial daoHi = new DaoHistorial();
        //Mostrar Datos de las tablas
        List<Usuario> listU = daoUs.mostarUsuario();
        List<Herramienta> listH = daoHe.mostrarHerramienta();
        List<Herramienta> listHU = daoHe.mostrarHerramientaUso();
        List<Personal> listP = daoPe.mostarPersonal();
        List<Historial> listHi = new ArrayList();
        if (request.getAttribute("msj") != null) {%>
    <script>
        alert('<%= request.getAttribute("msj")%>');
        location.replace('jsp/historial.jsp');
    </script>
    <%
        }
    %>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="brand">
                    <a href="<%=href%>"><p style=" color: wheat; font-family: fantasy;">Sistema de Control de Bodega</p></a>
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
                            <li><a href="../jsp/reporte.jsp" class=""><i class="fa fa-file-pdf-o"></i> <span>Reportes</span></a></li>
                            <li><a href="../jsp/devoluciones.jsp" class=""><i class="fa fa-clipboard"></i> <span>Historial Devolucion</span></a></li>
                            <li><a href="../jsp/historial.jsp" class="active"><i class="fa fa-list-ul"></i> <span>Historial Prestamos</span></a></li>
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
                                            <%--  CODIGO PARA CONTAR HERRAMIENTAS  --%>
                                            <%
                                                cont = 0;
                                                for (Herramienta he : listH) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <%--  CODIGO PARA CONTAR HERRAMIENTAS/  --%>
                                            <span class="icon"><i class="fa fa-gavel"></i></span>
                                            <p>
                                                <span class="number"><% out.write("" + (cont) + "");%></span>
                                                <span class="title">Total de Herramientas</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="<%=col%>" >
                                        <div class="metric">
                                            <%--  CODIGO PARA CONTAR HERRAMIENTAS EN USO  --%>
                                            <%
                                                cont = 0;
                                                for (Herramienta he : listHU) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <%--  CODIGO PARA CONTAR HERRAMIENTAS EN USO/  --%>
                                            <span class="icon"><i class="lnr lnr-briefcase"></i></span>
                                            <p>
                                                <span class="number"><% out.write("" + (cont) + "");%></span>
                                                <span class="title">Herramientas en uso</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="<%=col%>">
                                        <div class="metric">
                                            <%--  CODIGO PARA CONTAR PERSONAL  --%>
                                            <%
                                                cont = 0;
                                                for (Personal pe : listP) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <%--  CODIGO PARA CONTAR PERSONAL/  --%>
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
                                    <div class="col-md-3"> 
                                        <a href = "../jsp/manteUsuario.jsp"> 
                                            <div class="metric" >
                                                <%--  CODIGO PARA CONTAR USUARIOS  --%>
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
                                                <%--  CODIGO PARA CONTAR USUARIOS/  --%>
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
                            <h3 class="panel-title" style="font-family: fantasy; text-align: center;">Historial</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <form action="" method="Post">
                                    <select required name="txtCampo" class="form-control-static">
                                        <option selected disabled value="">Seleccione</option>
                                        <option value="p.id">ID Personal</option>
                                        <option value="p.nombre">Nombre Empleado</option>
                                        <option value="p.apellido">Apellido Empleado</option>
                                        <option value="hi.idPrestamoH">ID Historial</option>
                                        <option value="hi.idherramienta">ID Herramienta</option>
                                        <option value="h.nombreHerramienta">Nombre Herramienta</option>
                                        <option value="hi.fechaHora">Fecha y hora</option>
                                        <option value="hi.prespor">Asignada Por</option>
                                    </select>
                                    <input type="text" name="txtCriterio" required class="form-control-static" autocomplete="off">
                                    <button type="submit" name="btnFiltro"  class="btn btn-success"><i class="fa fa-search"></i> Buscar</button>
                                    <a class="btn btn-info" href="../jsp/historial.jsp"><i class="fa fa-refresh"></i> Cargar todos los Registros</a>
                                </form>
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-list-ol"></i> Historial Prestamo</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div style="overflow: scroll;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID Personal</th>
                                                        <th>Nombre</th>
                                                        <th>Apellido</th>
                                                        <th>ID Historial</th>
                                                        <th>ID Herramienta</th>
                                                        <th>Nombre Herramienta</th>
                                                        <th>Fecha y Hora</th>
                                                        <th>Asignada Por</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        String campo;
                                                        String criterio;
                                                        DaoHistorial dh = new DaoHistorial();
                                                        List<Historial> datos = new ArrayList();
                                                        if (request.getParameter("btnFiltro") != null) {
                                                            campo = request.getParameter("txtCampo");
                                                            criterio = request.getParameter("txtCriterio");
                                                            datos = dh.filtrarBusquedaH(campo, criterio);
                                                            request.setAttribute("filtro", datos);
                                                        }
                                                        if (request.getAttribute("filtro") != null) {
                                                            listHi = (List<Historial>) request.getAttribute("filtro");
                                                        } else {
                                                            listHi = daoHi.mostrarDetalleH();
                                                        }
                                                        for (Historial h : listHi) {
                                                    %>
                                                    <tr>
                                                        <td><%=h.getIdPersonal()%></td>
                                                        <td><%=h.getNombre()%></td>
                                                        <td><%=h.getApellido()%></td>
                                                        <td><%=h.getIdPrestamo()%></td>
                                                        <td><%=h.getIdHerramienta()%></td>
                                                        <td><%=h.getNombreHerramienta()%></td>
                                                        <td><%=h.getFechaHora()%></td>
                                                        <td><%=h.getPresPor()%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
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