<%-- 
* @Documento: manteUsuario.
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
    </head>
    <script>
        function cargar(id, userName, pass, tipo)
        {
            document.frmUsuarios.txtIdUsuario.value = id;
            document.frmUsuarios.txtUserName.value = userName;
            document.frmUsuarios.txtPassword.value = pass;
            document.frmUsuarios.txtTipo.value = tipo;
            document.frmUsuarios.btnGuardar.disabled = true;
            document.frmUsuarios.btnModificar.disabled = false;
            document.frmUsuarios.btnEliminar.disabled = false;
        }
        function des() {
            document.frmUsuarios.btnGuardar.disabled = false;
            document.frmUsuarios.btnModificar.disabled = true;
            document.frmUsuarios.btnEliminar.disabled = true;
        }
    </script>
    <% if (request.getAttribute("msj") != null) {%>
    <script>
        alert('<%= request.getAttribute("msj")%>');
        location.replace('jsp/manteUsuario.jsp');
    </script>
    <%
        }
        String user = "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "" + usuario + "";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            out.print("<script>location.replace('../jsp/');</script>");
        } else {
            out.print("<script>location.replace('../');</script>");
        }
        //Dao's
        DaoUsuario daoUs = new DaoUsuario();
        //Mostrar Datos de las tablas
        List<Usuario> listU = daoUs.mostarUsuario();
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><span> ADMINISTRADOR</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
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
                            <li><a href="../jsp/" class=""><i class="fa fa-home"></i> <span> Inicio Administrador</span></a></li>
                            <li><a href="../jsp/nuevoPrestamo.jsp" class=""><i class="fa fa-plus-circle"></i> <span>Nuevo Prestamo</span></a></li>
                            <li><a href="../jsp/reporte.jsp" class=""><i class="fa fa-file-pdf-o"></i> <span>Reportes</span></a></li>
                            <li><a href="../jsp/devoluciones.jsp" class=""><i class="fa fa-clipboard"></i> <span>Historial Devolucion</span></a></li>
                            <li><a href="../jsp/historial.jsp" class=""><i class="fa fa-list-ul"></i> <span>Historial Prestamos</span></a></li>
                            <li>
                                <a href="#subPages" data-toggle="collapse" class="collapsed "><i class="lnr lnr-pencil"></i> <span>Gestionar</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                                <div id="subPages" class="collapse ">
                                    <ul class="nav">
                                        <li><a href="../jsp/manteUsuario.jsp" class="active"><i class="lnr lnr-users"></i> Usuarios</a></li>
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
                <div class="main-content">
                    <div class="container-fluid">
                        <h3 class="page-title"><i class="fa fa-cogs"></i> Mantenimiento Usuarios</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <form name="frmUsuarios" action="../procesoUsuarios" method="POST">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><i class="lnr lnr-users"></i> Usuarios</h3>
                                        </div>
                                        <div class="panel-body">
                                            <label>ID: </label>
                                            <input type="number" min="2" class="form-control" name="txtIdUsuario" readonly placeholder="ID">
                                            <br>
                                            <label>Nombre de Usuario: </label>
                                            <input type="text" autocomplete="off" class="form-control" name="txtUserName" required autofocus placeholder="UserName">
                                            <br>
                                            <label>Password: </label>
                                            <input type="password" autocomplete="off" class="form-control" name="txtPassword" required placeholder="Password">
                                            <br>
                                            <label>Tipo: </label>
                                            <select name="txtTipo" class="form-control" required >
                                                <option disabled selected value="" >Seleccione</option>
                                                <option value="1">Administrador</option>
                                                <option value="2">Editor</option>
                                            </select>
                                            <br>
                                            <p class="demo-button">
                                                <button  type="submit" name="btnGuardar" class="btn btn-primary" onclick="if (!confirm('¿Desea Guardar el registro?'))
                                                            return false;"><i class="fa fa-save"></i> Guardar</button>
                                                <button disabled="" type="submit" name="btnModificar" class="btn btn-warning" onclick="if (!confirm('¿Desea Modificar el registro?'))
                                                            return false;"><i class="fa fa-pencil"></i> Modificar</button>
                                                <button disabled="" type="submit" name="btnEliminar" class="btn btn-danger" onclick="if (!confirm('¿Desea Eliminar el registro?'))
                                                            return false;"><i class="fa fa-trash-o"></i> Eliminar</button>
                                                <button type="reset" class="btn btn-info" title="Limpiar Cajas de texto" onclick="des();" >&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eraser"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                            </p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="lnr lnr-users"></i> Tabla Usuarios</h3>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nombre de usuario</th>
                                                    <th>Tipo</th>
                                                    <th>Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (Usuario us : listU) {
                                                        String tipo = "";
                                                        String val = "";
                                                        String mod = "";
                                                        String bg = "";
                                                        String borde = "";
                                                        if (us.getIdUsuario() == 1) {
                                                            val = "none";
                                                            mod = "<button class='btn btn-warning' data-toggle='modal' data-target='#myModal'>Modificar</button>";
                                                            bg = "#40e0d059";
                                                            borde = "solid red";
                                                        }
                                                        if (us.getTipo() == 1) {
                                                            tipo = "<span class='label label-warning'>Administrador</span>";
                                                        } else if (us.getTipo() == 2) {
                                                            tipo = "<span class='label label-success'>Editor</span>";
                                                        }
                                                %>
                                                <tr style="background: <%= bg%>; border: <%= borde%>;">
                                                    <td><%= us.getIdUsuario()%></td>
                                                    <td><%= us.getUserName()%></td>
                                                    <td><%= tipo%></td>
                                                    <td><%=mod%><a style="display: <%=val%>;" class="btn btn-success" href="javascript:cargar('<%=us.getIdUsuario()%>','<%=us.getUserName()%>','<%=us.getPassword()%>','<%=us.getTipo()%>');">Seleccionar</a></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                        <form action="../procesoUsuarios" method="POST" >
                                            <div class="modal fade" id="myModal" role="dialog">
                                                <div class="modal-dialog">
                                                    <!-- Modal contenedor-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"><span class="fa fa-times-circle"></span></button>
                                                            <center><label>Modificar Administrador</label></center>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden" value="1" name="txtIdUsuario"/>
                                                            <input type="hidden" value="1" name="txtTipo"/>
                                                            <label>Nombre de usuario</label>
                                                            <input type="text" class="form-control" autocomplete="off" autofocus required placeholder="Ingrese nombre de Usuario" name="txtUserName">
                                                            <label>Clave</label>
                                                            <input type="password" class="form-control" placeholder="Ingrese password" required name="txtPassword">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="reset"  class="btn btn-info"><span class="fa fa-eraser"></span> Limpiar</button>
                                                            <button type="submit" class="btn btn-warning" name="btnModificar" onclick="if (!confirm('¿Desea modificar el administrador?'))
                                                                        return false;" ><span class="fa fa-edit"></span> Modificar</button>
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span> Salir</button>
                                                        </div>
                                                    </div>
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