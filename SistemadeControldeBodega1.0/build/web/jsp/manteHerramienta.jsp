<%-- 
    * @Documento: manteHerramienta.
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
        <%--  SCRIPT PARA BUSCAR REGISTROS  --%>
        <script src="../js/buscadorTabla.js"></script>
    </head>
    <script>
        function cargar(a, b, c, d, e)
        {
            document.frmHerramienta.txtIdHerramienta.value = a;
            document.frmHerramienta.txtNombre.value = b;
            document.frmHerramienta.txtCategoria.value = c;
            document.frmHerramienta.txtUso.value = d;
            document.frmHerramienta.txtEstado.value = e;
            document.frmHerramienta.btnGuardar.disabled = true;
            document.frmHerramienta.btnModificar.disabled = false;
            document.frmHerramienta.btnEliminar.disabled = false;
        }
        function des() {
            document.frmHerramienta.btnGuardar.disabled = false;
            document.frmHerramienta.btnModificar.disabled = true;
            document.frmHerramienta.btnEliminar.disabled = true;
        }
    </script>
    <% if (request.getAttribute("msj") != null) {%>
    <script>
        alert('<%= request.getAttribute("msj")%>');
        location.replace('jsp/manteHerramienta.jsp');
    </script>
    <%
        }
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
        } else {
            out.print("<script>location.replace('../');</script>");
        }
        //Dao's
        DaoHerramienta daoHe = new DaoHerramienta();
        DaoCategoria daoCa = new DaoCategoria();
        //Mostrar Datos de las tablas
        List<Herramienta> listH = daoHe.mostrarHerramienta();
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
                                        <li><a href="../jsp/manteHerramienta.jsp" class="active"><i class="fa fa-gavel"></i> Herramientas</a></li>
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
                <div class="main-content">
                    <div class="container-fluid">
                        <h3 class="page-title"><i class="fa fa-cogs"></i> Mantenimiento Herramienta</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <form name="frmHerramienta" action="../procesoHerramienta" method="POST">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><i class="fa fa-gavel"></i> Herramientas</h3>
                                        </div>
                                        <div class="panel-body">
                                            <label>ID: </label>
                                            <input type="number" class="form-control" name="txtIdHerramienta" readonly placeholder="ID">
                                            <br>
                                            <label>Nombre: </label>
                                            <input type="text" pattern="[A-Z a-z ]+" autocomplete="off" class="form-control" name="txtNombre" required autofocus placeholder="">
                                            <br>
                                            <label>Categoria: </label>
                                            <select name="txtCategoria" class="form-control" required >
                                                <option disabled selected value="">Seleccione</option>
                                                <%
                                                    for (Categoria ca : listC) {
                                                %>
                                                <option value="<%=ca.getIdCategoria()%>"><%=ca.getNombreCategoria()%></option>
                                                <%
                                                    }
                                                %>
                                            </select><br>
                                            <label>Uso: </label>
                                            <select name="txtUso" class="form-control" >
                                                <option value="No">No</option>
                                            </select>
                                            <br>
                                            <label>Estado: </label>
                                            <select name="txtEstado" class="form-control" >
                                                <option value="Nueva">Nueva</option>
                                                <option value="Defectuosa">Defectuosa</option>
                                                <option value="Normal">Normal</option>
                                            </select>
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
                                                <button type="reset" class="btn btn-info" onclick="des();" title="Limpiar Cajas de texto" >&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eraser"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                            </p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-gavel"></i> Tabla Herramientas</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="input-group">
                                            <span class="input-group-addon" style="background: #00aff0;"><i class="fa fa-search"></i></span>
                                            <input id="searchTerm" class="form-control-static" placeholder="Buscar" type="text" onkeyup="doSearch();" />
                                        </div>
                                        <div style="overflow: scroll;height: 433px;">
                                            <table id="datos" class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>ID Categoria</th>
                                                        <th>Uso</th>
                                                        <th>Estado</th>
                                                        <th>Categoria</th>
                                                        <th>Seleccione</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Herramienta he : listH) {
                                                            String uso = "";
                                                            String estado = "";
                                                            String dis = "";
                                                            if (he.getUso().equals("Si")) {
                                                                uso = "class='bg bg-warning' style='color: white;'";
                                                                dis = "hidden=''";
                                                            } else if (he.getUso().equals("No")) {
                                                                uso = "class='bg bg-success' style='color: white;'";
                                                            }
                                                            if (he.getEstado().equals("Nueva")) {
                                                                estado = "class='bg bg-info' style='color: black;'";
                                                            } else if (he.getEstado().equals("Defectuosa")) {
                                                                estado = "class='bg bg-danger' style='color: white;'";
                                                            }
                                                    %>
                                                    <tr>
                                                        <td><%=he.getIdHerramienta()%></td>
                                                        <td><%=he.getNombre()%></td>
                                                        <td><%=he.getIdCategoria()%></td>
                                                        <td <%=uso%>><%=he.getUso()%></td>
                                                        <td <%=estado%>><%=he.getEstado()%></td>
                                                        <td><%=he.getNombreC()%></td>
                                                        <td <%= dis%>><a class="btn btn-success" href="javascript:cargar('<%=he.getIdHerramienta()%>','<%=he.getNombre()%>','<%=he.getIdCategoria()%>','<%=he.getUso()%>','<%=he.getEstado()%>');">Seleccionar</a></td>
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
