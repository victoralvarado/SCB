<%-- 
    * @Documento: manteCategoria.
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
        <title>Mantenimiento | SCB</title>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <!--CSS -->
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
        <%
            String user = "";
            String us = "";
            String li = "";
            String li2 = "";
            String href = "";
            HttpSession objSesion = request.getSession();
            String usuario;
            if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
                usuario = objSesion.getAttribute("usuario").toString();
                user = "" + usuario + "";
                us = "ADMINISTRADOR";
                li = "<li><a href='../jsp/' class=''><i class='fa fa-home'></i> <span> Inicio Administrador</span></a></li>";
                li2 = "<li><a href='../jsp/manteUsuario.jsp' class=''><i class='lnr lnr-users'></i> Usuarios</a></li>";
                href = "../jsp/";
            } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
                usuario = objSesion.getAttribute("usuario").toString();
                user = "" + usuario + "";
                us = "EDITOR";
                li = "<li><a href='../jsp/' class=''><i class='fa fa-home'></i> <span> Inicio Editor</span></a></li>";
                href = "../jsp/";
            } else if (objSesion.getAttribute("usuario") == null) {
                out.print("<script>location.replace('../');</script>");
            }
        %>
    </head>
    <script>
        function cargar(a, b)
        {
            document.frmCategoria.txtIdCategoria.value = a;
            document.frmCategoria.txtNombre.value = b;
            document.frmCategoria.btnGuardar.disabled = true;
            document.frmCategoria.btnModificar.disabled = false;
            document.frmCategoria.btnEliminar.disabled = false;
        }
        function des() {
            document.frmCategoria.btnGuardar.disabled = false;
            document.frmCategoria.btnModificar.disabled = true;
            document.frmCategoria.btnEliminar.disabled = true;
        }
    </script>
    <% if (request.getAttribute("msj") != null) {%>
    <script>
        alert('<%= request.getAttribute("msj")%>');
        location.replace('jsp/manteCategoria.jsp');
    </script>
    <%
        }
        //Dao's
        DaoCategoria daoCa = new DaoCategoria();
        //Mostrar Datos de las tablas
        List<Categoria> listC = daoCa.mostrarCategoria();
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
                            <li><a href="../jsp/historial.jsp" class=""><i class="fa fa-list-ul"></i> <span>Historial Prestamos</span></a></li>
                            <li>
                                <a href="#subPages" data-toggle="collapse" class="collapsed "><i class="lnr lnr-pencil"></i> <span>Gestionar</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPages" class="collapse ">
                                    <ul class="nav">
                                        <%=li2%>
                                        <li><a href="../jsp/manteHerramienta.jsp" class=""><i class="fa fa-gavel"></i> Herramientas</a></li>
                                        <li><a href="../jsp/mantePersonal.jsp" class=""><i class="fa fa-male"></i> Personal</a></li>
                                        <li><a href="../jsp/manteCategoria.jsp" class="active"><i class="fa fa-cog"></i> Categorias</a></li>
                                        <li><a href="../jsp/mantePrestamo.jsp" class=""><i class="fa fa-list-ol"></i> Prestamo</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="main">
                <div class="main-content">
                    <div class="container-fluid">
                        <h3 class="page-title"><i class="fa fa-cogs"></i> Mantenimiento Categoria</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <form name="frmCategoria" id="frmCategoria" action="../procesoCategoria" method="POST">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><i class="fa fa-cog"></i> Categoria</h3>
                                        </div>
                                        <div class="panel-body">
                                            <label>ID: </label>
                                            <input type="number" class="form-control" name="txtIdCategoria" readonly placeholder="ID">
                                            <br>
                                            <label>Nombre: </label>
                                            <input type="text" pattern="[A-Z a-z ]+" autocomplete="off" class="form-control" name="txtNombre" required autofocus placeholder="">
                                            <br>
                                            <p class="demo-button">
                                                <button type="submit" name="btnGuardar" class="btn btn-primary" onclick="if (!confirm('¿Desea Guardar el registro?'))
                                                            return false;"><i class="fa fa-save"></i> Guardar</button>
                                                <button disabled="" type="submit" name="btnModificar" class="btn btn-warning" onclick="if (!confirm('¿Desea Modificar el registro?'))
                                                            return false;"><i class="fa fa-pencil"></i> Modificar</button>
                                                <% if (us.equals("ADMINISTRADOR")) { %>
                                                <button disabled="" type="submit" name="btnEliminar" class="btn btn-danger" onclick="if (!confirm('¿Desea Eliminar el registro?'))
                                                            return false;"><i class="fa fa-trash-o"></i> Eliminar</button>
                                                <% } %>
                                                <button type="reset" onclick="des();" class="btn btn-info" title="Limpiar Cajas de texto" >&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eraser"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                            </p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-cog"></i> Tabla Categoria</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div style="overflow: scroll;height: 433px;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>Seleccione</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Categoria ca : listC) {
                                                    %>
                                                    <tr>
                                                        <td><%=ca.getIdCategoria()%></td>
                                                        <td><%=ca.getNombreCategoria()%></td>
                                                        <td><a class="btn btn-success" href="javascript:cargar('<%=ca.getIdCategoria()%>','<%=ca.getNombreCategoria()%>');">Seleccionar</a></td>
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
        <script src="../js/klorofil-common.js"></script>
    </body>
</html>