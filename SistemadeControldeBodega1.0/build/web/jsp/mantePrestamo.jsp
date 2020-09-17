<%-- 
    * @Documento: mantePrestamo.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page session="true" %>
<%@page import="java.util.*"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Entrega | SCB</title>
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
        function cargar(aa, a, b, c, d)
        {
            document.frmHerramienta.txtIdPrestamo.value = aa;
            document.frmHerramienta.txtIdPersonal.value = a;
            document.frmHerramienta.txtIdHerramienta.value = b;
            document.frmHerramienta.txtNombre.value = c;
            document.frmHerramienta.txtprepor.value = d;
            document.frmHerramienta.btnEntre.disabled = false;
            document.frmHerramienta.btnEliminar.disabled = false;
        }
        function des() {
            document.frmHerramienta.btnEntre.disabled = true;
        }
    </script>
    <% if (request.getAttribute("msj") != null) {%>
    <script>
        alert('<%= request.getAttribute("msj")%>');
        location.replace('jsp/mantePrestamo.jsp');
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
        DaoDetallePrestamo daoDe = new DaoDetallePrestamo();
        //Mostrar Datos de las tablas
        List<Herramienta> listH = daoHe.mostrarHerramienta();
        List<DetallePrestamo> listD = new ArrayList();
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
                                        <li><a href="../jsp/manteCategoria.jsp" class=""><i class="fa fa-cog"></i> Categorias</a></li>
                                        <li><a href="../jsp/mantePrestamo.jsp" class="active"><i class="fa fa-list-ol"></i> Prestamo</a></li>
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
                        <h3 class="page-title"><i class="fa fa-cogs"></i> Prestamo</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <form name="frmHerramienta" action="../procesoPrestamo" method="POST">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><i class="fa fa-list-ol"></i> Prestamo</h3>
                                        </div>
                                        <div class="panel-body">
                                            <label>ID Prestamo: </label>
                                            <input type="number" required  class="form-control" name="txtIdPrestamo" readonly placeholder="ID">
                                            <label>ID Personal: </label>
                                            <input type="number" required  class="form-control" name="txtIdPersonal" readonly placeholder="ID">
                                            <br>
                                            <label>ID Heramienta: </label>
                                            <input type="number" required  class="form-control" name="txtIdHerramienta" readonly placeholder="ID">
                                            <br>
                                            <label>Nombre: </label>
                                            <input type="text" autocomplete="off" readonly class="form-control" name="txtNombre" required >
                                            <label>Fecha y Hora:</label>
                                            <input type="text" name="txtFecHora" class="form-control" value="<%= (new java.util.Date()).toLocaleString()%>" readonly>
                                            <br>
                                            <input type="hidden" name="txtprepor" readonly>
                                            <input type="hidden" name="txtRecib" value="<%=user%>" class="form-control" readonly>
                                            <input type="hidden" value="No" name="txtUso" class="form-control" readonly>
                                            <label>Estado:</label>
                                            <select name="txtEstado" required class="form-control">
                                                <option value="" disabled selected>Seleccione</option>
                                                <option value="Nueva">Nueva</option>
                                                <option value="Normal">Normal</option>
                                                <option value="Defectuosa">Defectuosa</option>
                                            </select>
                                            <br>
                                            <p class="demo-button">
                                                <button disabled="" type="submit" name="btnEntre" class="btn btn-primary" onclick="if (!confirm('¿Desea Entregar la herramienta?'))
                                                            return false;"><i class="fa fa-save"></i> Entregar herramienta</button>
                                                <button type="reset" onclick="des();" class="btn btn-info" title="Limpiar Cajas de texto" >&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eraser"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
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
                                        <div style="overflow: scroll;height: 550px;">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>ID Categoria</th>
                                                        <th>Uso</th>
                                                        <th>Estado</th>
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
                <div class="col-md-12">
                    <form action="" method="Post">
                        <select required name="txtCampo" class="form-control-static">
                            <option selected disabled value="">Seleccione</option>
                            <option value="p.id">ID Personal</option>
                            <option value="p.nombre">Nombre Empleado</option>
                            <option value="p.apellido">Apellido Empleado</option>
                            <option value="d.idPrestamo">ID Prestamo</option>
                            <option value="d.idherramienta">ID Herramienta</option>
                            <option value="h.nombreHerramienta">Nombre Herramienta</option>
                            <option value="d.fechaHora">Fecha y hora</option>
                            <option value="d.prespor">Asignada Por</option>
                        </select>
                        <input type="text" name="txtCriterio" required class="form-control-static" autocomplete="off">
                        <button type="submit" name="btnFiltro"  class="btn btn-success"><i class="fa fa-search"></i> Buscar</button>
                        <a class="btn btn-info" href="../jsp/mantePrestamo.jsp"><i class="fa fa-refresh"></i> Cargar todos los Registros</a>
                    </form>
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-list-ol"></i> Detalle Prestamo</h3>
                            <div class="right">
                                <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                            </div>
                        </div>
                        <div class="panel-body no-padding">
                            <div style="overflow: scroll;">
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
                                            <th>Asignada Por</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            String campo;
                                            String criterio;
                                            DaoDetallePrestamo ddp = new DaoDetallePrestamo();
                                            List<DetallePrestamo> datos = new ArrayList();
                                            if (request.getParameter("btnFiltro") != null) {
                                                campo = request.getParameter("txtCampo");
                                                criterio = request.getParameter("txtCriterio");
                                                datos = ddp.mostrarDetalleF(campo, criterio);
                                                request.setAttribute("filtro", datos);
                                            }
                                            if (request.getAttribute("filtro") != null) {
                                                listD = (List<DetallePrestamo>) request.getAttribute("filtro");
                                            } else {
                                                listD = daoDe.mostrarDetalle();
                                            }
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
                                            <td><a class="btn btn-success" href="javascript:cargar('<%=de.getIdPrestamo()%>','<%=de.getIdPersonal()%>','<%=de.getIdHerramienta()%>','<%=de.getNombreHerramienta()%>','<%=de.getPresPor()%>');">Seleccionar</a></td>
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
                                    <a href="../jsp/nuevoPrestamo.jsp" class="btn btn-success"><i class="lnr lnr-plus-circle"></i><span> Ir a Nuevo Prestamo</span></a>
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