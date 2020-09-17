<%-- 
    * @Documento: index.
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
        <title>Inicio | SCB</title>
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
        HttpSession objSesion = request.getSession();
        String usuario;
        String li = "";
        String li2 = "";
        String us = "";
        String href = "";
        String col = "";
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "" + usuario + "";
            us = "ADMINISTRADOR";
            li = "<li><a href='../jsp/' class='active'><i class='fa fa-home'></i> <span> Inicio Administrador</span></a></li>";
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
        DaoCategoria daoCa = new DaoCategoria();
        DaoDetallePrestamo daoDe = new DaoDetallePrestamo();
        //Mostrar Datos de las tablas
        List<Usuario> listU = daoUs.mostarUsuario();
        List<Herramienta> listH = daoHe.mostrarHerramienta();
        List<Herramienta> listHU = daoHe.mostrarHerramientaUso();
        List<Personal> listP = daoPe.mostarPersonal();
        List<Categoria> listC = daoCa.mostrarCategoria();
        List<DetallePrestamo> listD = daoDe.mostrarDetalle();
    %>
    <script>
        function cargar(id, userName, pass, tipo)
        {
            document.frmUsuarios.txtIdUsuario.value = id;
            document.frmUsuarios.txtUserName.value = userName;
            document.frmUsuarios.txtPassword.value = pass;
            document.frmUsuarios.txtTipo.value = tipo;
        }
    </script>
    <body>
        <div id="wrapper" >
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="brand" >
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
                                            <%--  CODIGO PARA CONTAR HERAMIENTAS  --%>
                                            <%
                                                cont = 0;
                                                for (Herramienta he : listH) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <%--  CODIGO PARA CONTAR HERAMIENTAS/  --%>
                                            <span class="icon"><i class="fa fa-gavel"></i></span>
                                            <p>
                                                <span class="number"><% out.write("" + (cont) + "");%></span>
                                                <span class="title">Total de Herramientas</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="<%=col%>" >
                                        <div class="metric">
                                            <%--  CODIGO PARA CONTAR HERAMIENTAS EN USO  --%>
                                            <%
                                                cont = 0;
                                                for (Herramienta he : listHU) {
                                                    for (int i = 0; i < 1; i++) {
                                                        cont = cont + 1;
                                                    }
                                                }
                                            %>
                                            <%--  CODIGO PARA CONTAR HERAMIENTAS EN USO/  --%>
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
                                    <div class="col-md-3"> <a 
                                            href = "../jsp/manteUsuario.jsp"> <div class="metric" >
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
                            <h3 class="panel-title" style="font-family: fantasy; text-align: center;">Tablas</h3>
                        </div>
                        <div class="row">
                            <%-- USUARIOS QUE SOLO SE MOSTRARAN AL ADMINISTRADOR  --%>
                            <%
                                if (us.equals("ADMINISTRADOR")) {
                            %>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="lnr lnr-users"></i> Usuarios</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div style="overflow: scroll; height: 400px;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre de usuario</th>
                                                        <th>Nivel</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Usuario u : listU) {
                                                            String tipo = "";
                                                            if (u.getTipo() == 1) {
                                                                tipo = "<span class='label label-warning'>Administrador</span>";
                                                            } else if (u.getTipo() == 2) {
                                                                tipo = "<span class='label label-success'>Editor</span>";
                                                            }
                                                    %>
                                                    <tr>
                                                        <td><%= u.getIdUsuario()%></td>
                                                        <td><%= u.getUserName()%></td>
                                                        <td hidden=""><%= u.getPassword()%></td>
                                                        <td><%= tipo%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary"><i class="lnr lnr-plus-circle"></i><span> Nuevo Usuario</span></button>
                                                <a href="../jsp/manteUsuario.jsp" class="btn btn-success"><i class="lnr lnr-pencil"></i><span> Gestionar Usuarios</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="myModal" role="dialog">
                                        <form action="../procesoUsuarios" method="POST" >
                                            <div class="modal-dialog">
                                                <%-- MODAL PARA AGREGAR UN NUEVO USUARIO --%>
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span class="fa fa-times-circle"></span></button>
                                                        <center><label>Nuevo Usuario</label></center>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" min="2"  name="txtIdUsuario"/>
                                                        <label>Nombre de usuario: </label>
                                                        <input type="text" class="form-control" autocomplete="off" autofocus required placeholder="Ingrese nombre de Usuario" name="txtUserName">
                                                        <label>Clave: </label>
                                                        <input type="password" class="form-control" placeholder="Ingrese password" required name="txtPassword">
                                                        <label>Tipo: </label>
                                                        <select name="txtTipo" class="form-control" required >
                                                            <option disabled selected value="" >Seleccione</option>
                                                            <option value="1">Administrador</option>
                                                            <option value="2">Editor</option>
                                                        </select>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" name="btnGuardarN" class="btn btn-primary" onclick="if (!confirm('¿Desea Guardar el registro?'))
                                                                    return false;"><i class="fa fa-save"></i> Guardar</button>
                                                        <button type="reset"  class="btn btn-info"><span class="fa fa-eraser"></span> Limpiar</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span> Salir</button>
                                                    </div>
                                                </div>
                                                <%-- MODAL PARA AGREGAR UN NUEVO USUARIO/ --%>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <%-- USUARIOS QUE SOLO SE MOSTRARAN AL ADMINISTRADOR/  --%>
                            <%
                            } else if (us.equals("EDITOR")) {
                            %>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-list-ol"></i> Detalle Prestamo</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div class="widget-content nopadding">
                                            <div style="overflow: scroll; height: 400px;">
                                                <table class="table table-striped data-table">
                                                    <thead>
                                                        <tr>
                                                            <th>ID Personal</th>
                                                            <th>Nombre</th>
                                                            <th>Apellido</th>
                                                            <th>ID Prestamo</th>
                                                            <th>ID Herramienta</th>
                                                            <th>Nombre Herramienta</th>
                                                            <th>Fecha y Hora</th>
                                                            <th>Asignada por</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%                                                            for (DetallePrestamo de : listD) {
                                                        %>
                                                        <tr>
                                                            <td><%=de.getIdPersonal()%></td>
                                                            <td><%=de.getNombre()%></td>
                                                            <td><%=de.getApellido()%></td>
                                                            <td><%=de.getIdPrestamo()%></td>
                                                            <td><%=de.getIdHerramienta()%></td>
                                                            <td><%=de.getNombreHerramienta()%></td>
                                                            <td><%=de.getFechaHora()%></td>
                                                            <td><%=de.getPresPor()%></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <a href="../jsp/mantePrestamo.jsp" class="btn btn-success"><i class="lnr lnr-pencil"></i><span> Gestionar Prestamo</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-gavel"></i> Herramientas</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div style="overflow: scroll; height: 400px;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>ID Categoria</th>
                                                        <th>Uso</th>
                                                        <th>Estado</th>
                                                        <th>Categoria</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Herramienta he : listH) {
                                                            String uso = "";
                                                            String estado = "";
                                                            if (he.getUso().equals("Si")) {
                                                                uso = "class='bg bg-warning' style='color: white;'";
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
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <a href="../jsp/manteHerramienta.jsp" class="btn btn-success"><i class="lnr lnr-pencil"></i><span> Gestionar Herramientas</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-cog"></i> Categoria</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div style="overflow: scroll; height: 400px;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Categoria ca : listC) {
                                                    %>
                                                    <tr>
                                                        <td><%=ca.getIdCategoria()%></td>
                                                        <td><%=ca.getNombreCategoria()%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <a href="../jsp/manteCategoria.jsp" class="btn btn-success"><i class="lnr lnr-pencil"></i><span> Gestionar Categoria</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-male"></i> Personal</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div style="overflow: scroll; height: 400px;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>Apellido</th>
                                                        <th>Edad</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (Personal pe : listP) {
                                                    %>
                                                    <tr>
                                                        <td><%=pe.getIdPersonal()%></td>
                                                        <td><%=pe.getNombre()%></td>
                                                        <td><%=pe.getApellido()%></td>
                                                        <td><%=pe.getEdad()%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <a href="../jsp/mantePersonal.jsp" class="btn btn-success"><i class="lnr lnr-pencil"></i><span> Gestionar Personal</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%
                                if (us.equals("ADMINISTRADOR")) {
                            %>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-list-ol"></i> Detalle Prestamo</h3>
                                        <div class="right">
                                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        </div>
                                    </div>
                                    <div class="panel-body no-padding">
                                        <div class="widget-content nopadding">
                                            <div style="overflow: scroll; height: 400px;">
                                                <table class="table table-striped data-table">
                                                    <thead>
                                                        <tr>
                                                            <th>ID Personal</th>
                                                            <th>Nombre</th>
                                                            <th>Apellido</th>
                                                            <th>ID Prestamo</th>
                                                            <th>ID Herramienta</th>
                                                            <th>Nombre Herramienta</th>
                                                            <th>Fecha y Hora</th>
                                                            <th>Asignada por</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            for (DetallePrestamo de : listD) {
                                                        %>
                                                        <tr>
                                                            <td><%=de.getIdPersonal()%></td>
                                                            <td><%=de.getNombre()%></td>
                                                            <td><%=de.getApellido()%></td>
                                                            <td><%=de.getIdPrestamo()%></td>
                                                            <td><%=de.getIdHerramienta()%></td>
                                                            <td><%=de.getNombreHerramienta()%></td>
                                                            <td><%=de.getFechaHora()%></td>
                                                            <td><%=de.getPresPor()%></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <a href="../jsp/mantePrestamo.jsp" class="btn btn-success"><i class="lnr lnr-pencil"></i><span> Gestionar Prestamo</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
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